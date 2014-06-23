package hply.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class T3Dao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int getCount() {
		String sql = "SELECT COUNT(*) FROM TEST1";
		int i = jdbcTemplate.queryForObject(sql, int.class);
		System.out.println("i=" + i);
		return 0;
	}
}
