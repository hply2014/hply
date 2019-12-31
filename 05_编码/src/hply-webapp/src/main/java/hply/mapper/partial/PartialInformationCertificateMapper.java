/**
  * @ tianyongcang create in 2019-05-24 08:51:16
  */

package hply.mapper.partial;

import hply.domain.InformationCertificate;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;



/**
 * 数据表： [t_informationCertificate_certificate]
 * 10+B_信息登记证书类别表
 */
@Repository
public interface PartialInformationCertificateMapper {

	  public void insert(InformationCertificate informationCertificate);
	  
	  public void update(InformationCertificate informationCertificate);
	  
	  public void delete(String id);
	  
	  public InformationCertificate get(String id);
      
	  public int getVersion(String id);
	  
	  public List<InformationCertificate> getAll();
      
	  public int getRowCount();
	  
	  public List<InformationCertificate> getAllPaged(@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);
}

