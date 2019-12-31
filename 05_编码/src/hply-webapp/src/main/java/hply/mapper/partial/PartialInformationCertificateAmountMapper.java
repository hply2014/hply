/**
  * @ tianyongcang create in 2019-05-24 08:51:16
  */

package hply.mapper.partial;

import hply.domain.InformationCertificateAmount;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;



/**
 * 数据表： [t_information_certificate_amount]
 * 10+C_信息登记证书费
 */
@Repository
public interface PartialInformationCertificateAmountMapper {

	  public void insert(InformationCertificateAmount informationCertificateAmount);
	  
	  public void update(InformationCertificateAmount informationCertificateAmount);
	  
	  public void delete(String id);
	  
	  public InformationCertificateAmount get(String id);
      
	  public int getVersion(String id);
	  
	  public List<InformationCertificateAmount> getAll();
      
	  public int getRowCount();
	  
	  public List<InformationCertificateAmount> getAllPaged(@Param("pageIndex") int pageIndex, @Param("pageSize") int pageSize);
}

