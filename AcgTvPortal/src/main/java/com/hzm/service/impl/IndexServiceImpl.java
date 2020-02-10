package com.hzm.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrClient.Builder;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionLikeType;
import com.hzm.dao.IndexDao;
import com.hzm.domain.FriendLink;
import com.hzm.domain.IndexShow;
import com.hzm.domain.Video;
import com.hzm.domain.VideoType;
import com.hzm.domain.reponse.SearchResult;
import com.hzm.exception.MyException;
import com.hzm.service.IndexService;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Service
public class IndexServiceImpl implements IndexService<Video> {
	@Value("${start}")
	private String start;
	@Value("${jdbc.driver}")
	private String jdbcdriver;
	@Value("${number}")
	private String number;
	@Value("${cartoonvideotype}")
	private String cartoonvideotype;
	@Value("${musicvideotype}")
	private String musicvideotype;
	@Value("${gamevideotype}")
	private String gamevideotype;
	@Value("${sciencevideotype}")
	private String sciencevideotype;
	@Value("${moviceideotype}")
	private String moviceideotype;
	@Value("${repeatvideotype}")
	private String repeatvideotype;
	@Value("${dancevideotype}")
	private String dancevideotype;
	@Value("${updatingcartoonvideotype}")
	private String updatingcartoonvideotype;
	@Autowired
	private IndexDao id;
	@Resource(name = "builder")
	private Builder builder;
	@Resource(name = "jedisPool")
	private JedisPool jedisPool;

	@Transactional(readOnly = true)
	@Override
	public List<VideoType> getVideoTotal() throws MyException {
		List<VideoType> list = null;
		try (Jedis jedis = jedisPool.getResource();) {
			ObjectMapper objectMapper = new ObjectMapper();
			String string = jedis.get("videoupdatenumbers");

			if (StringUtils.isBlank(string)) {
				list = id.getVideoTotal();

				objectMapper.setSerializationInclusion(Include.NON_NULL);
				String writeValueAsString = objectMapper.writeValueAsString(list);
				jedis.set("videoupdatenumbers", writeValueAsString);
				jedis.expire("videoupdatenumbers", 3600);
			} else {
				CollectionLikeType type = objectMapper.getTypeFactory().constructCollectionLikeType(ArrayList.class,
						VideoType.class);
				list = objectMapper.readValue(string, type);
			}
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			throw new MyException();

		} catch (IOException e) {
			e.printStackTrace();
			throw new MyException();
		}

		return list;
	}

	@Transactional(readOnly = true)
	@Override
	public List<Video> getThelastVideo() {

		List<Integer> videoTypes = id.getVideoTypes(); // [0-7]
		Set<Integer> set = new HashSet<>();

		while (set.size() < 6) {
			Integer integer = videoTypes.get((int) (Math.random() * 8));
			set.add(integer);
		}
		List<Video> list = new ArrayList<>();
		set.stream().forEach((t) -> {

			Video findOne = id.findOne(t);
			if (!Objects.isNull(findOne))
				list.add(findOne);
		});

		return list;
	}

	@Transactional(readOnly = true)
	@Override
	public List<Video> getmoreVideo(Integer id) {

		List<Video> list = this.id.findmoreVideo(id);

		return list;
	}

	@Transactional(readOnly = true)
	@Override
	public List<IndexShow> findAll() {

		List<IndexShow> list = id.findAll();

		return list;
	}

	@Transactional(readOnly = true)
	@Override
	public Map<String, List<Video>> findvideos() {
		Map<String, List<Video>> map = new HashMap<>();
		List<Video> cartoonvideotypelist = id.findvideos(Integer.parseInt(start), Integer.parseInt(number),
				Integer.parseInt(cartoonvideotype));
		List<Video> musicvideotypelist = id.findvideos(Integer.parseInt(start), Integer.parseInt(number),
				Integer.parseInt(musicvideotype));
		List<Video> gamevideotypelist = id.findvideos(Integer.parseInt(start), Integer.parseInt(number),
				Integer.parseInt(gamevideotype));
		List<Video> sciencevideotypelist = id.findvideos(Integer.parseInt(start), Integer.parseInt(number),
				Integer.parseInt(sciencevideotype));
		List<Video> moviceideotypelist = id.findvideos(Integer.parseInt(start), Integer.parseInt(number),
				Integer.parseInt(moviceideotype));
		List<Video> repeatvideotypelist = id.findvideos(Integer.parseInt(start), Integer.parseInt(number),
				Integer.parseInt(repeatvideotype));
		List<Video> dancevideotypelist = id.findvideos(Integer.parseInt(start), Integer.parseInt(number),
				Integer.parseInt(dancevideotype));
		List<Video> updatingcartoonvideotypelist = id.findvideos(Integer.parseInt(start), Integer.parseInt(number),
				Integer.parseInt(updatingcartoonvideotype));

		map.put(cartoonvideotype, cartoonvideotypelist);
		map.put(musicvideotype, musicvideotypelist);
		map.put(gamevideotype, gamevideotypelist);
		map.put(sciencevideotype, sciencevideotypelist);
		map.put(moviceideotype, moviceideotypelist);
		map.put(repeatvideotype, repeatvideotypelist);
		map.put(dancevideotype, dancevideotypelist);
		map.put(updatingcartoonvideotype, updatingcartoonvideotypelist);

		return map;
	}

	@Transactional(readOnly = true)
	@Override
	public List<FriendLink> fridendLinks() {

		List<FriendLink> list = id.fridendLinks();

		return list;
	}

	@Override
	public SearchResult<Video> search(String search, int page, int row, String... videotype) throws MyException {

		SearchResult<Video> result = new SearchResult<>();
		List<Video> list2 = new ArrayList<>();
		try (HttpSolrClient client = builder.build()) {
			SolrQuery sq = new SolrQuery();
			sq.set("df", "name");

			result.setSearch(search);
			if (StringUtils.isBlank(search)) {
				sq.setQuery("*");
				sq.setSort("createTime", ORDER.desc);
			} else {
				sq.setQuery(search);
			}
//   0  1   3
//   3  2   3
//   6  3   3
			int start = (page - 1) * row;
			sq.setStart(start);
			sq.setRows(row);
			sq.setHighlight(true);
			sq.addHighlightField("name");
			sq.setHighlightSimplePre("<font  style='color: red;'>");
			sq.setHighlightSimplePost("</font>");

			if (videotype.length != 0)
				sq.setFilterQueries("videoType:" + videotype[0]);

			QueryResponse query = client.query(sq);

			SolrDocumentList list = query.getResults();
			Map<String, Map<String, List<String>>> map = query.getHighlighting();
			long l = list.getNumFound();
			list.stream().forEach((t) -> {
				Video video = new Video();
				video.setId(Integer.parseInt((String) t.get("id")));
				// video.setName((String) t.get("name"));
				VideoType videoType = new VideoType();
				videoType.setId(Integer.parseInt((String) t.get("videoType")));
				video.setVideoType(videoType);
				video.setCreateTime((Date) t.get("createTime"));
				video.setSrc((String) t.get("src"));

				Map<String, List<String>> map2 = map.get((String) t.get("id"));

				List<String> list3 = map2.get("name");

				if (!Objects.isNull(list3) && list3.size() > 0)
					video.setName(list3.get(0));
				list2.add(video);
			});
			result.setTotal(l);
			result.setList(list2);
			result.setCurrentpage(page);
			long number = l % row == 0 ? l / row : l / row + 1;
			result.setTotalpage(number);
		} catch (IOException | SolrServerException e) {
			e.printStackTrace();
			throw new MyException();
		}

		return result;
	}

	@Transactional(readOnly = true)
	@Override
	public List<VideoType> geTypes() throws MyException {
		List<VideoType> list = null;
		try (Jedis jedis = jedisPool.getResource();) {

			String string = jedis.get("videoupdatenumbers");
			ObjectMapper om = new ObjectMapper();
			om.setSerializationInclusion(Include.NON_EMPTY);
			if (Objects.isNull(string)) {

				list = id.getVideoType();
				try {
					String writeValueAsString = om.writeValueAsString(list);
					jedis.set("videoupdatenumbers", writeValueAsString);
					jedis.expire("videoupdatenumbers", 3600);
				} catch (JsonProcessingException e) {
					e.printStackTrace();
					throw new MyException();
				}
			} else {

				CollectionLikeType constructCollectionLikeType = om.getTypeFactory()
						.constructCollectionLikeType(ArrayList.class, VideoType.class);
				try {
					list = om.readValue(string, constructCollectionLikeType);
				} catch (IOException e) {
					e.printStackTrace();
					throw new MyException();
				}
			}
		}

		return list;
	}

	@Transactional(readOnly = true)
	@Override
	public List<IndexShow> more(Integer id) {

		List<IndexShow> list = this.id.more(id);

		return list;
	}

}
