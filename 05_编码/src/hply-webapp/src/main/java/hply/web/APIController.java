package hply.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/api", produces = "text/plain;charset=UTF-8")
public class APIController {

	@ResponseBody
	@RequestMapping(value = "/tree/{userId}")
	public String getTreeData(@PathVariable String userId) {
		System.out.println("getTreeData ..." + userId);
		return " ["
				+ " 	{\"key\": \"aaa\", \"title\": \"Books & Audible\", \"expanded\": true, \"tooltip\": \"这是一个神奇的世界.\", \"children\": ["
				+ " 		{\"title\": \"Books\", \"expanded\": true, \"children\": ["
				+ " 			{\"title\": \"Books\"},"
				+ " 			{\"title\": \"Kindle Books\"},"
				+ " 			{\"title\": \"Books For Study\"},"
				+ " 			{\"title\": \"Audiobooks\"}"
				+ " 		]},"
				+ " 		{\"title\": \"Movies, TV, Music, Games\", \"expanded\": true, \"selected\": true, \"children\": ["
				+ " 			{\"title\": \"Music\"},"
				+ " 			{\"title\": \"MP3 Downloads\"},"
				+ " 			{\"title\": \"Musical Instruments & DJ\"},"
				+ " 			{\"title\": \"Film & TV\"},"
				+ " 			{\"title\": \"Ble-ray\"},"
				+ " 			{\"title\": \"PC & Video Games\"}"
				+ " 		]},"
				+ " 		{\"title\": \"Electronics & Computers\", \"expanded\": true, \"selected\": true, \"children\": ["
				+ " 			{\"title\": \"Electronics\", \"expanded\": true, \"children\": ["
				+ " 				{\"title\": \"Camera & Photo\"},"
				+ " 				{\"title\": \"TV & Home Cinema\"},"
				+ " 				{\"title\": \"Audio & HiFi\"},"
				+ " 				{\"title\": \"Sat Nav & Car Electronics\"},"
				+ " 				{\"title\": \"Phones\"},"
				+ " 				{\"title\": \"Electronic Accessories\"}"
				+ " 			]},"
				+ " 			{\"title\": \"Computers\", \"expanded\": true, \"tooltip\": \"this just is a tst.\", \"children\": ["
				+ " 				{\"title\": \"Laptops\"},"
				+ " 				{\"title\": \"Tablets\"},"
				+ " 				{\"title\": \"Computer & Accessories\"},"
				+ " 				{\"title\": \"Computer Components\"},"
				+ " 				{\"title\": \"Software\"},"
				+ " 				{\"title\": \"" + userId + "\", \"tooltip\": \"this just is a tst.\" }"
				+ " 			]}" + " 		]}" + " 	]}" + " ]";
	}
}
