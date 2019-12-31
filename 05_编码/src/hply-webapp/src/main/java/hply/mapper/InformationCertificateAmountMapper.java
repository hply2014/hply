/**
  * @ tianyongcang create in 2019-05-24 08:51:16
  */
  
package hply.mapper;

import java.util.List;

import hply.domain.InformationCertificateAmount;
import hply.mapper.partial.PartialInformationCertificateAmountMapper;

import org.springframework.stereotype.Repository;



/**
 * 数据表： [t_information_certificate_amount]
 * 10+C_信息登记证书费
 */
@Repository
public interface InformationCertificateAmountMapper extends PartialInformationCertificateAmountMapper {
	
	public List<InformationCertificateAmount> getAllByInfo(String informationId);
}

