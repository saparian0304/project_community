package kr.co.pet.certification;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CertificationVO {

	private int no;
	private String certi_num;
	private Date certi_date;
	private String email;
}
