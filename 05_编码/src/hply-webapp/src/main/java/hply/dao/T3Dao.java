package hply.dao;

import java.math.BigInteger;

import org.springframework.stereotype.Repository;

@Repository
public class T3Dao extends BaseDAO {

	public int getCount() {
		String sql = "SELECT COUNT(*) FROM TEST1";
		BigInteger i = jdbcTemplate.queryForObject(sql, BigInteger.class);
		System.out.println("i=" + i);
		return 0;
	}
}
