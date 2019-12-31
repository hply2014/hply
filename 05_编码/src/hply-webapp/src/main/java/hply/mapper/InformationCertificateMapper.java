/**
  * @ tianyongcang create in 2019-05-24 08:51:16
  */
  
package hply.mapper;

import hply.domain.InformationCertificate;
import hply.mapper.partial.PartialInformationCertificateMapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;



/**
 * 数据表： [t_information_certificate]
 * 10+B_信息登记证书类别表
 */
@Repository
public interface InformationCertificateMapper extends PartialInformationCertificateMapper {

	
	public InformationCertificate getBy(@Param("type") String type,@Param("lockFlag") String lockFlag);
}

