import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrClient.Builder;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hzm.domain.CoursePub;
import com.hzm.domain.Video;
import com.hzm.domain.VideoType;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:application.xml") // 加载配置文件
public class Mytest {
	@Resource(name = "builder")
	private Builder builder;

	// @Test
	public void mo5() throws UnsupportedEncodingException {

		String md5Hex = DigestUtils.md5Hex("1");

		System.out.println(md5Hex);

	}

	// @Test
	public void json() throws JsonProcessingException {
		List<CoursePub> list = new ArrayList<>();
		CoursePub cPub = new CoursePub();
		cPub.setId("1");
		// cPub.setName("张三");
		list.add(cPub);
		ObjectMapper mapper = new ObjectMapper();
		mapper.setSerializationInclusion(Include.NON_NULL);
		String writeValueAsString = mapper.writeValueAsString(list);
		String writeValueAsString2 = mapper.writeValueAsString(cPub);
		System.out.println(writeValueAsString);
		System.out.println(writeValueAsString2);
	}

	// @Test
	public void json2() throws JsonProcessingException {
		try {
			List<VideoType> list = new ArrayList<>();
			VideoType cPub = new VideoType();
			cPub.setId(1);
			cPub.setTypeName("张三");
			list.add(cPub);
			ObjectMapper mapper = new ObjectMapper();
			// mapper.setSerializationInclusion(Include.NON_EMPTY);
			// String writeValueAsString = mapper.writeValueAsString(list);
			String writeValueAsString2 = mapper.writeValueAsString(cPub);
			// System.out.println(writeValueAsString);
			System.out.println(writeValueAsString2);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	// @Test
	public void gos() {

		// Builder builder = new Builder("http://localhost:8082/solr/");
		HttpSolrClient client = builder.build();

		try {
			SolrQuery sp = new SolrQuery();

			sp.set("df", "name");
			sp.setQuery("sb");
			// sp.setQuery("videoType:2");
			// sp.setFilterQueries("id:25");
			sp.setHighlight(true);
			sp.addHighlightField("name");
			sp.setStart(0);// 角标
			sp.setRows(20);

//			List<SortClause> value = new ArrayList<>();
//			SortClause sClause1 = new SortClause("createTime", ORDER.desc);
//			value.add(sClause1);
//			SortClause sClause2 = new SortClause("id", ORDER.desc);
//			value.add(sClause2);
//			sp.setSorts(value);
			// sp.setSort("createTime", ORDER.desc).setSort("id", ORDER.asc);
			QueryResponse query = client.query(sp);
			SolrDocumentList results = query.getResults();
			System.out.println("匹配数量:" + results.getNumFound());

			Map<String, Map<String, List<String>>> map = query.getHighlighting();
			results.stream().forEach((t) -> {
				Video video = new Video();
				String fieldValue = (String) t.getFieldValue("id");
				video.setId(Integer.parseInt(fieldValue));
				Map<String, List<String>> map2 = map.get(fieldValue);
				if (!Objects.isNull(map2)) {
					List<String> list2 = map2.get("name");
					if (!Objects.isNull(list2) && list2.size() > 0) {
						String string = list2.get(0);
						video.setName(string);
					}
				}
				video.setCreateTime((Date) t.get("createTime"));
				// video.setVideoType(Integer.parseInt((String) t.get("videoType")));
				System.out.println(video);
			});

		} catch (SolrServerException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// @Test
	public void goss() {

		Builder builder = new Builder("http://localhost:8082/solr/mycore2");
		try (HttpSolrClient client = builder.build()) {
			SolrQuery sp = new SolrQuery();
			sp.set("df", "keywords");
			sp.setQuery("智能 二号  人工 ");
			sp.set("defType", "dismax");
			sp.set("qf", "name^5 description^1");// 这里必须包含查询条件title //8 4 //5 15
			// sp.set("bf", "sum(name,description)");
			// sp.setFilterQueries("id:25");
			sp.setHighlight(true);
			sp.addHighlightField("name");
			sp.addHighlightField("description");
			sp.setStart(0);// 角标
			sp.setRows(4);

//			List<SortClause> value = new ArrayList<>();
//			SortClause sClause1 = new SortClause("createTime", ORDER.desc);
//			value.add(sClause1);
//			SortClause sClause2 = new SortClause("id", ORDER.desc);
//			value.add(sClause2);
//			sp.setSorts(value);
			// sp.setSort("createTime", ORDER.desc).setSort("id", ORDER.asc);
			QueryResponse query = client.query(sp);
			SolrDocumentList results = query.getResults();
			System.out.println("匹配数量:" + results.getNumFound());

			Map<String, Map<String, List<String>>> map = query.getHighlighting();
			results.stream().forEach((t) -> {
				CoursePub video = new CoursePub();
				String fieldValue = (String) t.getFieldValue("id");
				video.setId(fieldValue);
				Map<String, List<String>> map2 = map.get(fieldValue);
				if (!Objects.isNull(map2)) {
					List<String> list2 = map2.get("name");
					if (!Objects.isNull(list2) && list2.size() > 0) {
						String string = list2.get(0);
						video.setName(string);
					}
					List<String> list3 = map2.get("description");
					if (!Objects.isNull(list3) && list3.size() > 0) {
						String string = list3.get(0);
						video.setDescription(string);
					}
				}

				video.setTimestamp((Date) t.get("timestamp"));
				System.out.println(video);
			});

		} catch (SolrServerException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// @Test
	public void gossw() {

		Builder builder = new Builder("http://localhost:8082/solr/mycore2");
		List<SolrInputDocument> list = new ArrayList<>();
		SolrInputDocument document = new SolrInputDocument();
		document.setField("id", 1);
		document.setField("name", "哈哈222222");
		list.add(document);
		SolrInputDocument document2 = new SolrInputDocument();
		document2.setField("id", 2);
		document2.setField("name", "哈哈22");
		list.add(document2);
		try (HttpSolrClient client = builder.build()) {
			client.add(list);
			client.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

//
	// @Test
	public void gosswd() {

		Builder builder = new Builder("http://localhost:8082/solr/mycore2");
		try (HttpSolrClient client = builder.build()) {
			client.deleteById("1");
			client.commit();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Resource(name = "jedisPool")
	private JedisPool jp;

	// @Test
	public void gosswdss() {
		try (Jedis resource = jp.getResource();) {
			resource.set("xxx", "yyy");
			resource.expire("xxx", 3600);
		}
	}

}
