-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 12, 2016 at 04:35 PM
-- Server version: 5.5.31
-- PHP Version: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `q2a`
--

-- --------------------------------------------------------

--
-- Table structure for table `qa_blobs`
--

CREATE TABLE IF NOT EXISTS `qa_blobs` (
  `blobid` bigint(20) unsigned NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `cookieid` bigint(20) unsigned DEFAULT NULL,
  `createip` int(10) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`blobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_blobs`
--

INSERT INTO `qa_blobs` (`blobid`, `format`, `content`, `filename`, `userid`, `cookieid`, `createip`, `created`) VALUES
(5951803006649220091, 'jpeg', 0xffd8ffe000104a46494600010100000100010000fffe003b43524541544f523a2067642d6a7065672076312e3020287573696e6720494a47204a50454720763830292c207175616c697479203d2039300affdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc0001108002d006d03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fd53ae2f56f1cc734f710595edbd95a5b122e3529f05548382231900e0e46e2700f0031040c1fda2be243fc39f87ed25b395d475298595b953865ca967607b10aa403d8b2d7cdff03345d2bf682d2ef34ff1126a9670c77f343a6ddadecb159eaa9101e604456003c7f32ede855491d1f0c0d3f8c9f1c6696ee5b1f06def893c5977192b249a35bc97054fa36d658d4fb6d06b67e07fc704d4af61d27c49a96bfe14d5db848f5a85e1694e3a0590ba9f7da01f715ee5a2781b50f875611368d7525d58da01bb495002491ff108c6301c0e47a91b4f5c8b1e221a67c57d164d2ecec6cb5ad3674fdedf5ec424b7873d9075793d81017f888385280ded375d9a2b882cf52682469c7fa35f5aff00a9b8e09c6327636013b72411d09c1037abc465f827a5780fc313c975e2bbfd3744b24f3a59af75394470aa90771766f970403918e40239aa7f09be2369fe35d423d6f4ef15cf3f86e26962863bcba67b9bf75250bf91d638c1e572373704ed1c10573dea8ac687c63a24d711dbff0069dbc57121c2433b794ee7d95b04fe157354d6b4fd0e159751beb6b0898ed57b9956304fa0248e6819768ac6b2f1a787f51984369ae69d73310488e2bb8d9b00649c03d8547ff09d787f6971ac5a34438332ca0c63eae3e51f9d006ed151c13c7730a4b0c892c4e032ba3065607a10475a92800a28a2803e57fdb6cdccf7fe0db6894b29b5d4a7551d0ba7d9f1ff00a11fd6ba3f80de1ed0c7ec8be085bcba5d2a2834e4bc1a823057b7ba2e5cc8a7fbfe613c7393c60e7147ed917165a5f85bc3bacb3acba969ba8ee8ec11879d730488d1ca141ecb94727a7c807522be31d3be2778ab4ef0ed9e851fdadb46b19a692ced1feec024767da3039c6e23279e4f4048ada14e5536329d48c373ec3b2fda3f5c4b545bbb489ee1728d245110b260901c03f777001b69fbb9c738a59ff693d56dedddd34ef308e891c4324938ee401c9e492001924800d7ce3f0d34bf897f17a7bb8bc3d64b04168a7ccbdbd25605703fd58c72cc7a6074efe8792baf889e2bb1bab8b4b9b19e1b9b791a19a261ca3a92194fe208ad5524df2adcc5d4695dec7d29f1963bbf136a7a369ff11208f598edfcad54e816ecc2ca270e7c912818f39b28cc4b71f2801402d9b1a9fed0175a5d858691617361e12b207e6f2638a071101f761564645e48c928703a609c8f9b35df8bbe2ff10c76530822b79b4bd3de2b8b8bc9ca7da628db31229c1f9d434839fbc31dc64f69e1fd2fe3769cb0ea717806ff00cebbb5015a44b6919636c36d21d8ed3f80239e6a3d9a5a3dcbe76ddd6c7afd8fed3b2c1a4be9fa9ea5a6eb3cba19e69202658c93b4380154900e0e14038e9517873e3fddff006c19ada1f3adac61921b6c12e812668db00e48215a1751cf038ed5c3783fe057c5cf175f29d4346b2f0edb3b664b9d45d64907b8442771fab0a77c47f879f11b4df165ddaf85ec26d6f49b548ad96f628e43bcc71aabee2b195cefdf9c1c0ce38e95368ded72af2b5cf5fb6f895e20f8abade9fa0d8697a54b7485ef84dabdbb4905b041b77ec52373664c01903927b5476dfb466bb0c3e55edb5bcb7713c914b25ac4444ec8ecbb932490adb720127af534ff00d9a7e1ff008b745d0bc43aeebc96cbaadf5b0b7d3e38a6122855de72580e32ed823fd9af174f82bf1ca0290ae896a634c20617eb820719e99a4946ef506e5647d53f037c4973e2ad2b5dbf92116f6ada911044abb5411147e6e076cc9bc9f724f7af4baf31f830d6fe0ff0ee99e0fbd99a4f10c2924b7ac884c6d7076cb2857ef8f357f315e9d59b355b05150dede41a75a4d75732ac16d0a192495ce15140c927d80a8b4dd52db57b5fb45a48648b7321254a90ca704104020823a1a433ccfc75fb3d697e3dd76e354bbd7356b6967c6e8e091360c0c003729c01e9d393ea6bc1bc69fb34ea1f0f75d9afaef50f1178a7c13372eda52c5f6eb018e43469186913fda4f9c7a1afb428aa5268565d8f9cbe1cf883c3fa3e8b0e9be06f89da3c3a6dbaed5d335458c4b6feccad8933f5c579dfc53f0df83afbc493ea7a9fc4d51abdd90d2699e178229e6b97030088c23b64800640ec39e2beacf107c34f0978ae532eb3e19d275494ff00cb4bbb28e47ffbe88cd58f0f780fc37e121ff124d034cd24fad95a47113f8a8068ba416b9f2e7c21fd97b58f10ebf16bfe26bcd4f4cf0bc5224d69a06a49035cdd323874927c27eec06552101ddc72474afafc0c0c0e94b4526ee0925b11dc4eb6b6f2cce7091a97627b00326be37d13c49af7c51d474ebbd0342b9d67fb2a71345736d27970c33cb3fda9f32970549dcaac0237cbc0eb5f64cb124f13c6ea191c15653d083d4565f86bc27a3783ac5acb44d36db4bb46732186d6311a963d4e077a01a3e4b83c49afea5178eb4f8d74abcd4b4e6d4351bfbef29e46b4c9286188061c7982565ddb82eddd82d82231f1aae2e3ecf73677da6ea5aa5d3cd6b0431dbb35e9217f733a5ce72ceef83b17f76aa482a0039fad34af05685a1dd6a57361a4da5a5c6a4dbef248a20ad707d5c8ebd4f5ae3b51fd9ffc156f63abbe8da259e81a95fc6c8fa8d8dbaacc993c9538e33de9dd0acfb9f35cff001ba48b51975c4b5b18cb79f1dd6a36c9b65b9791de54b77752ac4848e201770f9770046734df0d7c7fd7edf476b98a08a0b28e56b7d46fe3b68f4e46f33e7850a44ec11c98de3127ca7120e73835f47f813f67af08785bc0973e1bb8d3e1d6acafa637375f6d85312be000768181800018f4ae9f4ef851e0fd27c333f87ad3c3ba7c1a24f9f36c5605f2df3ea3bd3bc7b0ad2ee7cdd37c43b14f0fc3ad2788b46b89ed6ead26bdd3adf4a36f1112b8cc72b3126555dadb4b65b77258d7b87c07d41bc53e117f143de5bcb73ac48d2cf0da5b086381c33653007cce09219ce4b11d700635ec3e0a78174bf0edde836be16d321d22ecee9ed16dd764a7d5877ae93c3fe1dd33c29a4c1a5e8f630e9da7c036c56d6e815107b0152edd0a57ea7fffd9, NULL, 2, NULL, 2130706433, '2016-09-12 16:27:49');

-- --------------------------------------------------------

--
-- Table structure for table `qa_cache`
--

CREATE TABLE IF NOT EXISTS `qa_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  PRIMARY KEY (`type`,`cacheid`),
  KEY `lastread` (`lastread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_cache`
--

INSERT INTO `qa_cache` (`type`, `cacheid`, `content`, `created`, `lastread`) VALUES
('i_200', 5951803006649220091, 0xffd8ffe000104a46494600010100000100010000fffe003b43524541544f523a2067642d6a7065672076312e3020287573696e6720494a47204a50454720763830292c207175616c697479203d2039300affdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc0001108002d006d03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fd53ae2755f1b4534d710595edbd95a5b122e3529f05548382231900e0e46e2700f0031040c1fda27e23bfc39f003496ce5751d4a61676e54e1972a59d81ec42a900f62cb5f387c0dd1b4afda074abcd3fc449aa59c31dfcd0e9b76b7b2c567aaa4407981115800f1fccbb7a15524747c006a7c64f8e334b772d8f836f7c49e2cbb8c95924d1ade4b82a7d1b6b2c6a7db6835b3f043e3826a7790e93e24d4b5ff0a6aedc247ad42f0b4a71d02c85d4fbed00fb8af70d13c117ff000f34f8ce8b7525d58da001b4a50023c7fc42318c070391ea46d3d722c788869bf15b477d2ed2c6cb59d3674fdedf5ec424b7873d9075793d81017f888385201bba66b53473c167a9343234e3fd1af6d7fd4dc704e3193b1b009db9208e84e081d0d7884bf0574af01f862792ebc55a869ba259279d2cd7ba9ca23855483b8bb37cb8201c8c72011cd53f84ff0011b4ff001aea11eb7a778aa7b8f0e44d2c50c77974cf737eea4a17f23ac7183cae46e6e09da3820ae7bdd1589178c3459ae23b7fed3b78ae243848676f29dcfb2b609fc2ae6abad69fa242b2ea37d6d61131daaf732ac609f40491cd032fd158767e34d03509961b4d734eb998824470ddc6cd80324e01ec2983c73e1fd85bfb5ed1a21c199650631f571f28fce8037e8a820b88ee624961912589c0657460cac0f4208eb53d00145145007cabfb6cfda26bff00075b42a594daea53aa8e85d3ecf8ff00d08feb5d1fc06f0f688bfb23f8216f2e934a860d392f06a08c15edee8b973229feff00984f1ce4f1839c51fb635cd9697e17f0f6b2ceb2ea5a6ea3ba3b0461e75cc12234728507b2e51c9e9f201d48af8cf4ef89de2ad3bc3b67a147f6b6d1ac669a4b3b47fbb0091d9f68c0e71b88c9e793d0122b6853954d8ca75230dcfb0acbf68dd6e3b444bbb489ee1728d245110b260901c03f777001b69fbb9c738a5b8fda4754b7b7674d3bcd2bd12388649271dc80393c924003249001af9cbe1a699f12fe2f4f771787ac96082d14f997b7a4ac0ae07fab18e598f4c0e9dfd0f2575f113c576375716973633c3736f2343344c3947524329fc4115aaa49be55b98ba8d2bbd8fa53e32c577e26d4f46d3fe22411eb31dbf95aa9d02dd985944e1cf9225031e736519896e3e5002805b33ea9f1fae74cb0b0d22c2e6c3c25640fcde4c7140e2203eec2ac8c8bc919250e074c1391f36ebbf177c5fe218eca610456f3697a7bc5717179394fb4c51b66245383f3a869073f7863b8c9ed3c3fa5fc6ed3961d4e2f00dff9d776a02b4896d232c6d86da43b1da7f00473cd47b34b47b97cedbbad8f5eb1fda6e4834a7b0d4f52d3b59e5d0cf3490132c649da1c00aa4807070a01c74a8fc39f1faeff00b60cd6d0f9d6d630c90db60974093346d8072410ad0ba8e781c76ae1bc1ff02be2e78baf94ea1a3597876d9db325cea2eb2483dc2213b8fd5852fc47f87df1174df165d5af85ec66d6b49b648ad92f638e43bcc71aabee2b195cefdf9c1c0ce38e95368ded72af2b5cf5fb5f893aff00c53d6b4fd06c34bd2a5ba42f7c26d5edda482d820dbbf6291b9b32600c81c93daa3b6fda2b5c862f2ef6dade5bb89e48a592d62222764765dc9924856db90093d7a9a7fecd5f0ffc5ba2e85e21d735e4b65d56fad85be9f1c5309142aef392c071976c11fecd78ba7c16f8e301485745b531a61030bf5c1038cf4cd24a377a8372b23ea8f81fe25b9f15695aedfc910b7b66d48882255daa088a3f3703b664de4fb927bd7a60e95e61f068c1e0ff000f699e0fbd95a4f1042924b7ac884c6d7076cb2857ef8f357f315e9e3a566cd56c2d155af2f20d3ace6bab99560b6810c924ae70a8a06493ec0543a76a96dab5b7da2d65678b7b2121082194e08208c8208e8690cf35f1d7ecf9a5f8f35db9d52ef5bd5eda49b1ba38244d8303000dca7007a74e4fa9af07f19fecd7a87c3ed766bebbd43c45e28f04cdcbb696b17dbac06390d1a461a44ff693e71e86bed1a2a949a159763e72f875e20f0fe8fa2c3a6f81be2768f0e9b6ebb574cd516312dbfb32b624cfd715e77f14fc37e0ebef124fa9ea7f13546af764349a6785e08a79ae5c0c022308ed92001903b0e78afaaf5ff869e13f164be6eb3e1ad275494ffcb4bbb28e47ff00be88cd4de1ef02786fc28bff00124d034cd23d4d95a47113f8a8145d20b5cf97be10fecc1ac78875f8b5ff00135e6a7a6f85e29126b4d0352481ae6e991c3a493e13f76032a9080eee3923a57d800606074a36d2d26ee0925b10dc4eb6d6f2cce7091a97627b00326be39d13c4baf7c50d434ebcd0342b9d67fb2a71345736d27970c33cb3fda9f32970549dcaac0237cbc0eb5f634b124d134722874705594f420f5acdf0e784f46f06d8359689a6db69768d21730da462352c7a9c0ef481a3e4c83c49afea5178eb4f8d74abcd4b4e6d4351bfbef29e46b4c9286188061c7982565ddb82eddd82d82231f1a6e2e3ecf73677da6ea5aa5d3cd6b0431dbb35e9217f733a5ce72ceef83b17f76aa482a0039fac74cf06685a1dd6a57361a4da5a5c6a4dbef258620ad70deae475ea7ad71b7ff00fc150596b0fa368967a06a37f13abea3636eab3273c9538e33deaae8567dcf9be7f8dd245a94bae25ad8c65bcf8eeb51b64db2dcbc8ef2a5bbba95624247100bb87cbb802339a6f86be3f6bf6fa3b5cc5045059472b5bea37f1db47a723799f3c285227608e4c6f1893e53890739c1afa3bc11fb3d7843c25e06baf0d5c69f0eb7657b37da6ebed90262572000768181800018f4ae9f4ef851e10d27c333f87ad3c3ba7c1a24f9f36c5605f2df3ea3bd3bc7b0ad2ee7cdf37c43b14f0f43ad2788b46b89ed6ead26bdd3adf4a36f1112b8cc72b3126555dadb4b65b77258d7b6fc09d41bc51e116f13b5e5bcb73ac48d2cf0dada88a381c3365303ef3824867392c475c018d9b0f829e05d2fc3b77a0daf85b4c8748bb3ba7b45b75d929f561deba5f0ff8734cf0a6930699a3d943a769f00db15b5ba05441ec054bb74295fa9fffd9, '2016-09-12 16:28:13', '2016-09-12 16:28:13'),
('i_30', 5951803006649220091, 0xffd8ffe000104a46494600010100000100010000fffe003b43524541544f523a2067642d6a7065672076312e3020287573696e6720494a47204a50454720763830292c207175616c697479203d2039300affdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc0001108000c001e03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fae3c55f14341d43c49afda78d3589224b1d565b7b2d2acee3c931c7104db2c85595c96259861b1c720e2b5342fda6f40d33526b1fed1935581b625b461e292762ca0f2100c7270146ee8493ce07a36adf04fc2f79a9de6a30dabe9f797d1b43772db15cce8df7836f56eb9e718cf19ce056b786fe1d689e0cf0ccfa468d6c6c61943969908329775c17c918cf4c71818000c7155eed89f78e4fc3ff00b42e89e22bdd22dedade5ff89a5c1b7b66f310ef65dbbf807a287049fafa57ab6e03a9af20f127c2eb6d3d6ce2b4d775cb6866ba8e17892ed4aed6280e32871dcfd58fa0c6f787fe1bc5a6cd1b4baf6b5a98587605beb9471c88fe6e101cfca7be3e63c74c16ea09f73fffd9, '2016-09-12 16:28:11', '2016-09-12 16:28:11'),
('i_40', 5951803006649220091, 0xffd8ffe000104a46494600010100000100010000fffe003b43524541544f523a2067642d6a7065672076312e3020287573696e6720494a47204a50454720763830292c207175616c697479203d2039300affdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc00011080010002803012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fb835df19ea1e39f18f8a7441a82f87bc37a33c3672ea2543196670db9724e139000620f6c609a6e99adda7c36d2e28f46f117f6bc01d638ec6ee54b994bb13f7a60d1aaa704e5f270a71cfcb5c9fc49f803e2cd5bc7d7bae2ead3c7a06a170b35d5968ee432ede0650a924905be750c4163f2e3a62e89fb3678975df163c3fdb5ab69de0f6b8f3dfce94a4c14676c681e20ccd862bb9801839e4f15a28c6db90dcba23e83b5f8b9e1d7b588cda95b89980521645019fbed05ba75393c63bd5ed3fe24689a95dc56d0de4666964f2d17cd8c9639c0c00c49e7b8af1af167ecd9a5e87676d6da243ae6ada8ddcdfbcbd3751a3411a0c904840a030e3a1248e3d0e4a5b6a3e1cf14e8daac7e0fd746a505bdbdbda421da4b7c0807552bcbed0e0f3c3649e700cd905d9f520e945794693f13fc5bab4b631cbe08bfd33ce921591a789c84573cb1206005ee09c81c9028a92cffd9, '2016-09-12 16:27:59', '2016-09-12 16:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `qa_categories`
--

CREATE TABLE IF NOT EXISTS `qa_categories` (
  `categoryid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) unsigned NOT NULL DEFAULT '0',
  `position` smallint(5) unsigned NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `parentid` (`parentid`,`tags`),
  UNIQUE KEY `parentid_2` (`parentid`,`position`),
  KEY `backpath` (`backpath`(200))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `qa_categories`
--

INSERT INTO `qa_categories` (`categoryid`, `parentid`, `title`, `tags`, `content`, `qcount`, `position`, `backpath`) VALUES
(1, NULL, 'Company', 'company', '', 7, 1, 'company'),
(2, NULL, 'Product', 'product', '', 6, 2, 'product'),
(3, NULL, 'TechOps', 'techops', '', 3, 3, 'techops'),
(4, NULL, 'Finance', 'finance', '', 1, 4, 'finance');

-- --------------------------------------------------------

--
-- Table structure for table `qa_categorymetas`
--

CREATE TABLE IF NOT EXISTS `qa_categorymetas` (
  `categoryid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`categoryid`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_contentwords`
--

CREATE TABLE IF NOT EXISTS `qa_contentwords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  `count` tinyint(3) unsigned NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_contentwords`
--

INSERT INTO `qa_contentwords` (`postid`, `wordid`, `count`, `type`, `questionid`) VALUES
(3, 1, 1, 'C', 1),
(3, 2, 1, 'C', 1),
(3, 9, 1, 'C', 1),
(3, 3, 1, 'C', 1),
(3, 6, 1, 'C', 1),
(1, 1, 1, 'Q', 1),
(1, 2, 1, 'Q', 1),
(1, 3, 2, 'Q', 1),
(1, 5, 1, 'Q', 1),
(1, 4, 1, 'Q', 1),
(1, 6, 2, 'Q', 1),
(1, 10, 1, 'Q', 1),
(1, 11, 1, 'Q', 1),
(1, 12, 1, 'Q', 1),
(1, 13, 1, 'Q', 1),
(2, 14, 1, 'A', 1),
(2, 12, 1, 'A', 1),
(2, 1, 1, 'A', 1),
(4, 17, 1, 'Q', 4),
(4, 1, 1, 'Q', 4),
(4, 18, 1, 'Q', 4),
(4, 15, 1, 'Q', 4),
(4, 16, 1, 'Q', 4),
(5, 20, 1, 'Q', 5),
(5, 21, 1, 'Q', 5),
(5, 18, 1, 'Q', 5),
(5, 15, 1, 'Q', 5),
(5, 22, 1, 'Q', 5),
(5, 7, 1, 'Q', 5),
(5, 23, 1, 'Q', 5),
(6, 17, 1, 'Q', 6),
(6, 1, 1, 'Q', 6),
(6, 8, 2, 'Q', 6),
(6, 25, 1, 'Q', 6),
(6, 26, 1, 'Q', 6),
(6, 15, 1, 'Q', 6),
(6, 24, 1, 'Q', 6),
(7, 28, 1, 'Q', 7),
(7, 29, 1, 'Q', 7),
(7, 27, 1, 'Q', 7),
(7, 30, 1, 'Q', 7),
(7, 18, 1, 'Q', 7),
(7, 15, 1, 'Q', 7),
(7, 31, 1, 'Q', 7),
(8, 1, 1, 'Q', 8),
(8, 18, 1, 'Q', 8),
(8, 32, 2, 'Q', 8),
(8, 34, 1, 'Q', 8),
(8, 35, 1, 'Q', 8),
(8, 36, 1, 'Q', 8),
(8, 37, 1, 'Q', 8),
(8, 38, 1, 'Q', 8),
(8, 39, 1, 'Q', 8),
(8, 40, 1, 'Q', 8),
(8, 41, 1, 'Q', 8),
(8, 42, 1, 'Q', 8),
(8, 33, 1, 'Q', 8),
(9, 1, 1, 'Q', 9),
(9, 18, 1, 'Q', 9),
(9, 15, 1, 'Q', 9),
(9, 44, 1, 'Q', 9),
(9, 40, 1, 'Q', 9),
(9, 38, 1, 'Q', 9),
(9, 45, 1, 'Q', 9),
(10, 1, 1, 'Q', 10),
(10, 18, 1, 'Q', 10),
(10, 46, 1, 'Q', 10),
(10, 48, 1, 'Q', 10),
(10, 49, 1, 'Q', 10),
(10, 30, 1, 'Q', 10),
(10, 12, 1, 'Q', 10),
(10, 50, 1, 'Q', 10),
(10, 51, 1, 'Q', 10),
(10, 52, 1, 'Q', 10),
(10, 53, 1, 'Q', 10),
(11, 55, 1, 'Q', 11),
(11, 56, 1, 'Q', 11),
(11, 57, 1, 'Q', 11),
(11, 58, 1, 'Q', 11),
(11, 59, 1, 'Q', 11),
(11, 60, 1, 'Q', 11),
(11, 61, 1, 'Q', 11),
(11, 8, 1, 'Q', 11),
(11, 15, 1, 'Q', 11),
(12, 30, 1, 'Q', 12),
(12, 8, 1, 'Q', 12),
(12, 67, 1, 'Q', 12),
(12, 68, 1, 'Q', 12),
(12, 50, 1, 'Q', 12),
(12, 65, 1, 'Q', 12),
(12, 26, 1, 'Q', 12),
(12, 69, 1, 'Q', 12),
(12, 70, 1, 'Q', 12),
(13, 30, 1, 'Q', 13),
(13, 18, 1, 'Q', 13),
(13, 67, 1, 'Q', 13),
(13, 68, 1, 'Q', 13),
(13, 74, 1, 'Q', 13),
(13, 75, 1, 'Q', 13),
(13, 76, 1, 'Q', 13),
(13, 73, 1, 'Q', 13),
(13, 77, 1, 'Q', 13),
(13, 55, 1, 'Q', 13),
(13, 78, 1, 'Q', 13),
(14, 30, 1, 'Q', 14),
(14, 8, 1, 'Q', 14),
(14, 67, 1, 'Q', 14),
(14, 68, 1, 'Q', 14),
(14, 50, 1, 'Q', 14),
(14, 65, 1, 'Q', 14),
(14, 7, 1, 'Q', 14),
(14, 79, 1, 'Q', 14),
(14, 80, 1, 'Q', 14),
(14, 81, 1, 'Q', 14),
(14, 82, 1, 'Q', 14),
(14, 83, 1, 'Q', 14),
(14, 84, 1, 'Q', 14),
(14, 71, 1, 'Q', 14),
(15, 30, 1, 'Q', 15),
(15, 8, 1, 'Q', 15),
(15, 68, 1, 'Q', 15),
(15, 50, 1, 'Q', 15),
(15, 87, 1, 'Q', 15),
(15, 26, 1, 'Q', 15),
(15, 85, 1, 'Q', 15),
(16, 23, 1, 'Q', 16),
(16, 59, 1, 'Q', 16),
(16, 18, 1, 'Q', 16),
(16, 88, 1, 'Q', 16),
(16, 89, 1, 'Q', 16),
(16, 90, 1, 'Q', 16),
(17, 28, 1, 'Q', 17),
(17, 1, 1, 'Q', 17),
(17, 88, 1, 'Q', 17),
(17, 95, 1, 'Q', 17),
(17, 96, 1, 'Q', 17),
(18, 17, 1, 'Q', 18),
(18, 1, 1, 'Q', 18),
(18, 18, 1, 'Q', 18),
(18, 100, 1, 'Q', 18),
(18, 98, 1, 'Q', 18),
(18, 99, 1, 'Q', 18),
(19, 101, 1, 'A', 18),
(19, 102, 1, 'A', 18),
(19, 84, 1, 'A', 18),
(19, 103, 1, 'A', 18),
(20, 93, 2, 'A', 17),
(20, 94, 2, 'A', 17),
(20, 104, 1, 'A', 17),
(20, 105, 1, 'A', 17),
(20, 106, 1, 'A', 17),
(20, 88, 2, 'A', 17),
(20, 1, 1, 'A', 17),
(20, 107, 1, 'A', 17),
(20, 108, 1, 'A', 17),
(20, 3, 1, 'A', 17),
(20, 109, 1, 'A', 17),
(20, 110, 1, 'A', 17),
(20, 91, 1, 'A', 17),
(20, 75, 1, 'A', 17),
(20, 111, 1, 'A', 17),
(20, 7, 1, 'A', 17),
(20, 112, 1, 'A', 17),
(20, 113, 1, 'A', 17),
(20, 114, 1, 'A', 17),
(20, 115, 1, 'A', 17),
(20, 116, 1, 'A', 17),
(20, 117, 1, 'A', 17),
(20, 118, 1, 'A', 17),
(20, 80, 1, 'A', 17),
(20, 119, 1, 'A', 17),
(20, 8, 1, 'A', 17),
(20, 120, 1, 'A', 17),
(20, 121, 1, 'A', 17),
(20, 122, 1, 'A', 17),
(20, 123, 1, 'A', 17),
(21, 124, 1, 'A', 16),
(21, 125, 1, 'A', 16),
(21, 126, 1, 'A', 16),
(22, 14, 1, 'A', 15),
(22, 127, 1, 'A', 15),
(22, 84, 1, 'A', 15),
(22, 128, 1, 'A', 15),
(22, 129, 2, 'A', 15),
(22, 130, 1, 'A', 15),
(22, 81, 1, 'A', 15),
(22, 82, 1, 'A', 15),
(22, 131, 1, 'A', 15),
(22, 7, 1, 'A', 15),
(22, 132, 1, 'A', 15),
(22, 80, 2, 'A', 15),
(22, 133, 1, 'A', 15),
(22, 77, 1, 'A', 15),
(22, 108, 1, 'A', 15),
(22, 134, 1, 'A', 15),
(23, 136, 1, 'Q', 23),
(23, 17, 1, 'Q', 23),
(23, 1, 1, 'Q', 23),
(23, 8, 2, 'Q', 23),
(23, 137, 1, 'Q', 23),
(23, 138, 1, 'Q', 23),
(23, 84, 1, 'Q', 23),
(23, 88, 1, 'Q', 23),
(23, 89, 1, 'Q', 23),
(24, 108, 2, 'A', 23),
(24, 139, 1, 'A', 23),
(24, 15, 1, 'A', 23),
(24, 140, 1, 'A', 23),
(24, 80, 1, 'A', 23),
(24, 141, 1, 'A', 23),
(24, 88, 1, 'A', 23),
(24, 89, 1, 'A', 23),
(24, 142, 1, 'A', 23),
(24, 7, 1, 'A', 23),
(24, 143, 1, 'A', 23),
(25, 14, 1, 'A', 14),
(25, 67, 1, 'A', 14),
(25, 68, 1, 'A', 14),
(25, 144, 1, 'A', 14),
(25, 8, 1, 'A', 14),
(25, 65, 1, 'A', 14),
(25, 26, 1, 'A', 14),
(25, 79, 1, 'A', 14),
(25, 134, 1, 'A', 14),
(25, 59, 1, 'A', 14),
(25, 145, 1, 'A', 14),
(25, 80, 1, 'A', 14),
(25, 82, 1, 'A', 14),
(25, 77, 1, 'A', 14),
(25, 146, 1, 'A', 14),
(25, 147, 1, 'A', 14),
(25, 148, 1, 'A', 14),
(25, 149, 1, 'A', 14),
(26, 14, 1, 'A', 13),
(26, 150, 1, 'A', 13),
(26, 76, 1, 'A', 13),
(26, 151, 1, 'A', 13),
(26, 59, 1, 'A', 13),
(26, 60, 1, 'A', 13),
(27, 14, 1, 'A', 12),
(27, 2, 1, 'A', 12),
(27, 152, 1, 'A', 12),
(27, 1, 1, 'A', 12),
(27, 60, 1, 'A', 12),
(28, 153, 1, 'A', 11),
(28, 67, 1, 'A', 11),
(28, 68, 1, 'A', 11),
(28, 144, 1, 'A', 11),
(28, 154, 1, 'A', 11),
(28, 155, 1, 'A', 11),
(28, 7, 2, 'A', 11),
(28, 156, 1, 'A', 11),
(28, 157, 1, 'A', 11),
(28, 158, 1, 'A', 11),
(28, 159, 1, 'A', 11),
(28, 160, 1, 'A', 11),
(29, 153, 1, 'A', 10),
(29, 1, 1, 'A', 10),
(29, 48, 1, 'A', 10),
(29, 161, 1, 'A', 10),
(29, 46, 1, 'A', 10),
(29, 162, 1, 'A', 10),
(29, 2, 1, 'A', 10),
(29, 163, 1, 'A', 10),
(30, 153, 1, 'A', 9),
(30, 1, 1, 'A', 9),
(30, 44, 1, 'A', 9),
(30, 40, 1, 'A', 9),
(31, 164, 1, 'A', 8),
(31, 153, 1, 'A', 8),
(31, 1, 1, 'A', 8),
(31, 165, 1, 'A', 8),
(31, 40, 1, 'A', 8),
(31, 61, 1, 'A', 8),
(31, 37, 1, 'A', 8),
(31, 38, 1, 'A', 8),
(31, 39, 1, 'A', 8),
(32, 162, 1, 'A', 7),
(32, 8, 1, 'A', 7),
(32, 166, 1, 'A', 7),
(32, 26, 1, 'A', 7),
(32, 167, 1, 'A', 7),
(32, 153, 1, 'A', 7),
(32, 168, 1, 'A', 7),
(32, 169, 1, 'A', 7),
(32, 170, 1, 'A', 7),
(32, 27, 1, 'A', 7),
(33, 171, 1, 'A', 6),
(33, 172, 1, 'A', 6),
(33, 153, 1, 'A', 6),
(33, 173, 1, 'A', 6),
(34, 108, 1, 'A', 5),
(34, 174, 1, 'A', 5),
(34, 175, 1, 'A', 5),
(35, 153, 1, 'A', 4),
(35, 22, 1, 'A', 4),
(36, 176, 1, 'C', 18),
(36, 177, 1, 'C', 18),
(36, 178, 1, 'C', 18),
(36, 179, 1, 'C', 18),
(36, 84, 1, 'C', 18),
(36, 180, 1, 'C', 18),
(37, 179, 1, 'C', 18),
(37, 1, 1, 'C', 18),
(37, 181, 1, 'C', 18),
(38, 35, 1, 'A', 11),
(38, 26, 1, 'A', 11),
(38, 182, 1, 'A', 11),
(38, 183, 1, 'A', 11),
(38, 160, 1, 'A', 11),
(38, 68, 1, 'A', 11),
(38, 1, 1, 'A', 11),
(38, 164, 1, 'A', 11),
(38, 184, 1, 'A', 11),
(38, 60, 1, 'A', 11);

-- --------------------------------------------------------

--
-- Table structure for table `qa_cookies`
--

CREATE TABLE IF NOT EXISTS `qa_cookies` (
  `cookieid` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `createip` int(10) unsigned NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`cookieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_iplimits`
--

CREATE TABLE IF NOT EXISTS `qa_iplimits` (
  `ip` int(10) unsigned NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `ip` (`ip`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_iplimits`
--

INSERT INTO `qa_iplimits` (`ip`, `action`, `period`, `count`) VALUES
(2130706433, 'A', 409367, 16),
(2130706433, 'C', 409367, 2),
(2130706433, 'Q', 409367, 1),
(2130706433, 'R', 409366, 1),
(2130706433, 'U', 409367, 1),
(2130706433, 'V', 409367, 3),
(2130706433, 'W', 409367, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_messages`
--

CREATE TABLE IF NOT EXISTS `qa_messages` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('PUBLIC','PRIVATE') NOT NULL DEFAULT 'PRIVATE',
  `fromuserid` int(10) unsigned NOT NULL,
  `touserid` int(10) unsigned NOT NULL,
  `fromhidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tohidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` varchar(8000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`messageid`),
  KEY `type` (`type`,`fromuserid`,`touserid`,`created`),
  KEY `touserid` (`touserid`,`type`,`created`),
  KEY `fromhidden` (`fromhidden`),
  KEY `tohidden` (`tohidden`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `qa_messages`
--

INSERT INTO `qa_messages` (`messageid`, `type`, `fromuserid`, `touserid`, `fromhidden`, `tohidden`, `content`, `format`, `created`) VALUES
(1, 'PUBLIC', 1, 2, 0, 0, 'Hi there!', '', '2016-09-12 16:22:37');

-- --------------------------------------------------------

--
-- Table structure for table `qa_options`
--

CREATE TABLE IF NOT EXISTS `qa_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_options`
--

INSERT INTO `qa_options` (`title`, `content`) VALUES
('allow_change_usernames', '1'),
('allow_close_questions', '1'),
('allow_login_email_only', ''),
('allow_multi_answers', '1'),
('allow_no_category', ''),
('allow_no_sub_category', ''),
('allow_private_messages', '1'),
('allow_self_answer', '1'),
('allow_user_walls', '1'),
('approve_user_required', '0'),
('avatar_allow_gravatar', '1'),
('avatar_allow_upload', '1'),
('avatar_default_show', ''),
('avatar_message_list_size', '20'),
('avatar_profile_size', '200'),
('avatar_q_list_size', '0'),
('avatar_q_page_a_size', '40'),
('avatar_q_page_c_size', '20'),
('avatar_q_page_q_size', '50'),
('avatar_store_size', '400'),
('avatar_users_size', '30'),
('block_bad_words', ''),
('block_ips_write', ''),
('cache_acount', '18'),
('cache_ccount', '3'),
('cache_flaggedcount', ''),
('cache_qcount', '17'),
('cache_queuedcount', ''),
('cache_tagcount', '10'),
('cache_uapprovecount', '1'),
('cache_unaqcount', '0'),
('cache_unselqcount', '14'),
('cache_unupaqcount', '15'),
('cache_userpointscount', '2'),
('captcha_module', 'reCAPTCHA'),
('captcha_on_anon_post', '1'),
('captcha_on_feedback', '1'),
('captcha_on_register', '1'),
('captcha_on_reset_password', '1'),
('captcha_on_unapproved', '0'),
('captcha_on_unconfirmed', '0'),
('columns_tags', '3'),
('columns_users', '2'),
('comment_on_as', '1'),
('comment_on_qs', '1'),
('confirm_user_emails', '1'),
('confirm_user_required', '0'),
('custom_answer', ''),
('custom_ask', ''),
('custom_comment', ''),
('custom_footer', ''),
('custom_header', ''),
('custom_in_head', ''),
('db_version', '59'),
('do_ask_check_qs', '1'),
('do_close_on_select', '0'),
('do_complete_tags', '1'),
('do_count_q_views', '1'),
('do_example_tags', '1'),
('editor_for_as', 'WYSIWYG Editor'),
('editor_for_cs', ''),
('editor_for_qs', 'WYSIWYG Editor'),
('event_logger_to_database', ''),
('event_logger_to_files', ''),
('extra_field_active', '0'),
('extra_field_display', '0'),
('extra_field_label', ''),
('extra_field_prompt', ''),
('facebook_app_id', ''),
('feedback_email', 'test@test.com'),
('feedback_enabled', '1'),
('feed_for_qa', '1'),
('feed_for_questions', '1'),
('feed_for_tag_qs', ''),
('feed_for_unanswered', '1'),
('feed_per_category', '1'),
('flagging_hide_after', '5'),
('flagging_notify_every', '2'),
('flagging_notify_first', '1'),
('flagging_of_posts', '1'),
('follow_on_as', '1'),
('form_security_salt', '6zukmt1e83sm338ep4nb3nn97xo2q24l'),
('from_email', 'no-reply@example.com'),
('home_description', ''),
('hot_weight_answers', '100'),
('hot_weight_a_age', '100'),
('hot_weight_q_age', '100'),
('hot_weight_views', '100'),
('hot_weight_votes', '100'),
('links_in_new_window', ''),
('logo_height', ''),
('logo_show', ''),
('logo_url', ''),
('logo_width', ''),
('mailing_enabled', ''),
('match_ask_check_qs', '3'),
('match_example_tags', '3'),
('max_copy_user_updates', '10'),
('max_len_q_title', '120'),
('max_num_q_tags', '5'),
('max_rate_ip_as', '20000'),
('max_rate_ip_cs', '20000'),
('max_rate_ip_flags', '20000'),
('max_rate_ip_logins', '20'),
('max_rate_ip_messages', '20000'),
('max_rate_ip_qs', '20000'),
('max_rate_ip_registers', '5'),
('max_rate_ip_uploads', '20000'),
('max_rate_ip_votes', '20000'),
('max_rate_user_as', '20000'),
('max_rate_user_cs', '20000'),
('max_rate_user_flags', '20000'),
('max_rate_user_messages', '20000'),
('max_rate_user_qs', '20000'),
('max_rate_user_uploads', '20000'),
('max_rate_user_votes', '20000'),
('max_store_user_updates', '50'),
('min_len_a_content', '12'),
('min_len_c_content', '12'),
('min_len_q_content', '0'),
('min_len_q_title', '12'),
('min_num_q_tags', '0'),
('moderate_anon_post', '0'),
('moderate_by_points', '0'),
('moderate_edited_again', '0'),
('moderate_notify_admin', '1'),
('moderate_points_limit', '150'),
('moderate_unapproved', '0'),
('moderate_unconfirmed', '0'),
('moderate_update_time', '1'),
('moderate_users', '0'),
('mouseover_content_on', ''),
('nav_activity', '0'),
('nav_ask', '1'),
('nav_categories', '1'),
('nav_home', ''),
('nav_hot', '0'),
('nav_qa_is_home', '0'),
('nav_questions', '1'),
('nav_tags', '1'),
('nav_unanswered', '1'),
('nav_users', '1'),
('neat_urls', '5'),
('notify_admin_q_post', ''),
('notify_users_default', '1'),
('pages_prev_next', '3'),
('page_size_ask_check_qs', '3'),
('page_size_ask_tags', '5'),
('page_size_home', '20'),
('page_size_qs', '20'),
('page_size_q_as', '10'),
('page_size_tags', '30'),
('page_size_tag_qs', '20'),
('page_size_una_qs', '20'),
('page_size_users', '30'),
('page_size_wall', '10'),
('permit_anon_view_ips', '70'),
('permit_close_q', '70'),
('permit_delete_hidden', '40'),
('permit_edit_a', '100'),
('permit_edit_c', '70'),
('permit_edit_q', '70'),
('permit_edit_silent', '40'),
('permit_flag', '110'),
('permit_hide_show', '70'),
('permit_moderate', '100'),
('permit_post_a', '150'),
('permit_post_c', '150'),
('permit_post_q', '150'),
('permit_post_wall', '110'),
('permit_retag_cat', '70'),
('permit_select_a', '100'),
('permit_view_q_page', '150'),
('permit_view_voters_flaggers', '20'),
('permit_vote_a', '120'),
('permit_vote_down', '120'),
('permit_vote_q', '120'),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('q_urls_remove_accents', ''),
('q_urls_title_length', '50'),
('recaptcha_private_key', ''),
('recaptcha_public_key', ''),
('register_notify_admin', '0'),
('show_a_c_links', '1'),
('show_a_form_immediate', 'if_no_as'),
('show_custom_answer', '0'),
('show_custom_ask', '0'),
('show_custom_comment', '0'),
('show_custom_footer', ''),
('show_custom_header', ''),
('show_custom_home', ''),
('show_custom_in_head', ''),
('show_custom_register', ''),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', ''),
('show_custom_welcome', '0'),
('show_c_reply_buttons', '1'),
('show_fewer_cs_from', '10'),
('show_full_date_days', '7'),
('show_message_history', '1'),
('show_notice_visitor', ''),
('show_notice_welcome', ''),
('show_post_update_meta', '1'),
('show_register_terms', '0'),
('show_selected_first', '1'),
('show_url_links', '1'),
('show_user_points', '1'),
('show_user_titles', '1'),
('show_view_counts', ''),
('show_view_count_q_page', ''),
('show_when_created', '1'),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', 'ltr'),
('site_theme', 'SnowFlat'),
('site_theme_mobile', 'Snow'),
('site_title', 'Localhost Q&A'),
('site_url', 'http://localhost/q2a/'),
('smtp_active', ''),
('solr_highlight_by_default', '1'),
('sort_answers_by', 'created'),
('suspend_register_users', '0'),
('tags_or_categories', 'tc'),
('tag_separator_comma', '0'),
('votes_separated', ''),
('voting_on_as', '1'),
('voting_on_qs', '1'),
('voting_on_q_page_only', ''),
('wysiwyg_editor_upload_images', '');

-- --------------------------------------------------------

--
-- Table structure for table `qa_pages`
--

CREATE TABLE IF NOT EXISTS `qa_pages` (
  `pageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  `permit` tinyint(3) unsigned DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext,
  PRIMARY KEY (`pageid`),
  UNIQUE KEY `position` (`position`),
  KEY `tags` (`tags`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `qa_postmetas`
--

CREATE TABLE IF NOT EXISTS `qa_postmetas` (
  `postid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`postid`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_posts`
--

CREATE TABLE IF NOT EXISTS `qa_posts` (
  `postid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) unsigned DEFAULT NULL,
  `categoryid` int(10) unsigned DEFAULT NULL,
  `catidpath1` int(10) unsigned DEFAULT NULL,
  `catidpath2` int(10) unsigned DEFAULT NULL,
  `catidpath3` int(10) unsigned DEFAULT NULL,
  `acount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `selchildid` int(10) unsigned DEFAULT NULL,
  `closedbyid` int(10) unsigned DEFAULT NULL,
  `userid` int(10) unsigned DEFAULT NULL,
  `cookieid` bigint(20) unsigned DEFAULT NULL,
  `createip` int(10) unsigned DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `lastip` int(10) unsigned DEFAULT NULL,
  `upvotes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `downvotes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` int(10) unsigned DEFAULT NULL,
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(8000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`postid`),
  KEY `type` (`type`,`created`),
  KEY `type_2` (`type`,`acount`,`created`),
  KEY `type_4` (`type`,`netvotes`,`created`),
  KEY `type_5` (`type`,`views`,`created`),
  KEY `type_6` (`type`,`hotness`),
  KEY `type_7` (`type`,`amaxvote`,`created`),
  KEY `parentid` (`parentid`,`type`),
  KEY `userid` (`userid`,`type`,`created`),
  KEY `selchildid` (`selchildid`,`type`,`created`),
  KEY `closedbyid` (`closedbyid`),
  KEY `catidpath1` (`catidpath1`,`type`,`created`),
  KEY `catidpath2` (`catidpath2`,`type`,`created`),
  KEY `catidpath3` (`catidpath3`,`type`,`created`),
  KEY `categoryid` (`categoryid`,`type`,`created`),
  KEY `createip` (`createip`,`created`),
  KEY `updated` (`updated`,`type`),
  KEY `flagcount` (`flagcount`,`created`,`type`),
  KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  KEY `lastip` (`lastip`,`updated`,`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `qa_posts`
--

INSERT INTO `qa_posts` (`postid`, `type`, `parentid`, `categoryid`, `catidpath1`, `catidpath2`, `catidpath3`, `acount`, `amaxvote`, `selchildid`, `closedbyid`, `userid`, `cookieid`, `createip`, `lastuserid`, `lastip`, `upvotes`, `downvotes`, `netvotes`, `lastviewip`, `views`, `hotness`, `flagcount`, `format`, `created`, `updated`, `updatetype`, `title`, `content`, `tags`, `name`, `notify`) VALUES
(1, 'Q', NULL, 1, 1, NULL, NULL, 1, 1, 2, NULL, 1, NULL, 2130706433, 1, 2130706433, 0, 0, 0, 2130706433, 1, 42294400000, 0, '', '2016-09-12 15:27:12', '2016-09-12 15:33:10', 'E', 'Is this a test?', 'Is this a first test question.\n\nEDIT - Made it a real question.', 'first,test', NULL, NULL),
(2, 'A', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, 1, 2130706433, 1, 0, 1, NULL, 0, NULL, 0, '', '2016-09-12 15:29:32', '2016-09-12 15:35:23', 'S', NULL, 'yes it is ..', NULL, NULL, NULL),
(3, 'C', 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 15:31:22', NULL, NULL, NULL, 'Is this really a question?', NULL, NULL, NULL),
(4, 'Q', NULL, 1, 1, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42294800000, 0, '', '2016-09-12 15:38:16', NULL, NULL, 'Company name', 'What is your company name?', 'company', NULL, NULL),
(5, 'Q', NULL, 1, 1, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42294800000, 0, '', '2016-09-12 15:39:23', NULL, NULL, 'Company incorporation', 'When was your company incorporated and where?', '', NULL, NULL),
(6, 'Q', NULL, 1, 1, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42294800000, 0, '', '2016-09-12 15:40:09', NULL, NULL, 'Company website', 'What is the URL of the company website?', 'company', NULL, NULL),
(7, 'Q', NULL, 1, 1, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42294800000, 0, '', '2016-09-12 15:40:56', NULL, NULL, 'Company employees', 'How many employees does your company employ?', 'company', NULL, NULL),
(8, 'Q', NULL, 1, 1, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42294800000, 0, '', '2016-09-12 15:41:51', NULL, NULL, 'Business details', 'Is your business classified as small, minority or women-owned business? Please provide details.', 'company', NULL, NULL),
(9, 'Q', NULL, 1, 1, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42294800000, 0, '', '2016-09-12 15:42:34', NULL, NULL, 'Company ownership', 'Is your company privately owned or public?', 'company', NULL, NULL),
(10, 'Q', NULL, 2, 2, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, 1, 2130706433, 0, 0, 0, 2130706433, 1, 42294800000, 0, '', '2016-09-12 15:43:40', '2016-09-12 15:46:00', 'A', 'Solution type', 'Is your solution SaaS based? Does it support on-premises deployment?', 'saas', NULL, NULL),
(11, 'Q', NULL, 2, 2, NULL, NULL, 2, 1, 28, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42310900000, 0, '', '2016-09-12 15:47:21', NULL, NULL, 'Mobility support', 'Which mobile operating systems are supported by the company?', 'mobile-os', NULL, NULL),
(12, 'Q', NULL, 2, 2, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 1, -1, 2130706433, 1, 42278800000, 0, '', '2016-09-12 15:48:08', NULL, NULL, 'User creation and provisioning', 'Does the cloud platform support creation of local users?', 'user-management', NULL, NULL),
(13, 'Q', NULL, 2, 2, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42294800000, 0, '', '2016-09-12 15:50:49', NULL, NULL, 'Directory support', 'Does your cloud platform integrate with LDAP directory services? Which ones?', 'user-management', NULL, NULL),
(14, 'Q', NULL, 2, 2, NULL, NULL, 1, 0, 25, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42294800000, 0, '', '2016-09-12 15:52:43', NULL, NULL, 'USer partitions', 'Does the cloud platform support creation and partitions to create separate groups for management?', 'user-administration', NULL, NULL),
(15, 'Q', NULL, 2, 2, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42294800000, 0, '', '2016-09-12 15:53:37', NULL, NULL, 'Support delegation', 'Does the platform support delegation of administration?', 'user-administration', NULL, NULL),
(16, 'Q', NULL, 3, 3, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 1, 0, 1, 2130706433, 1, 42310800000, 0, '', '2016-09-12 15:54:18', NULL, NULL, 'Data centers', 'Where are your data centers located?', 'data-center', NULL, NULL),
(17, 'Q', NULL, 3, 3, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42294800000, 0, '', '2016-09-12 15:54:53', NULL, NULL, 'Physical security', 'How is data secured physically?', 'data-security', NULL, NULL),
(18, 'Q', NULL, 4, 4, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42294800000, 0, '', '2016-09-12 15:55:45', NULL, NULL, 'Recurring revenue', 'What is your annual recurring revenue?', 'revenue', NULL, NULL),
(19, 'A', 18, 4, 4, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 15:58:32', NULL, NULL, NULL, '100M USD for FY15', NULL, NULL, NULL),
(20, 'A', 17, 3, 3, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:01:15', NULL, NULL, NULL, 'Physical security: All customer product data is hosted in a highly secure data-center with 24x7 physical security and requires multi-factor (id, biometrics, password) authentication to access the premise (under video surveillance)', NULL, NULL, NULL),
(21, 'A', 16, 3, 3, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:01:46', NULL, NULL, NULL, 'United States, Russia', NULL, NULL, NULL),
(22, 'A', 15, 2, 2, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:03:40', NULL, NULL, NULL, 'Yes.\n\nAdministrators for each partition may create separate configuration and policies to apply to services in that partition.', NULL, NULL, '@'),
(23, 'Q', 21, 3, 3, NULL, NULL, 1, 0, NULL, NULL, 1, NULL, 2130706433, NULL, NULL, 0, 0, 0, 2130706433, 1, 42294900000, 0, '', '2016-09-12 16:04:53', NULL, NULL, 'Update to data-centers', 'So what is the expansion plan for the data-centers?', 'data-center', NULL, NULL),
(24, 'A', 23, 3, 3, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:05:46', NULL, NULL, NULL, 'In CY16, company plans to build data-centers in EMEA and LATAM.', NULL, NULL, NULL),
(25, 'A', 14, 2, 2, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, 1, 2130706433, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:09:21', '2016-09-12 16:17:21', 'S', NULL, 'Yes, Cloud platform supports the creation of partitions that are used to separate services into independently managed entities.', NULL, NULL, NULL),
(26, 'A', 13, 2, 2, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:10:06', NULL, NULL, NULL, 'Yes, common LDAP directories are supported.', NULL, NULL, NULL),
(27, 'A', 12, 2, 2, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:11:06', NULL, NULL, NULL, 'Yes. This feature is supported.', NULL, NULL, NULL),
(28, 'A', 11, 2, 2, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, 1, 2130706433, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:12:21', '2016-09-12 16:21:54', 'S', NULL, 'NewCo cloud platform supports apps, content and devices running iOS, Android and Windows.', NULL, NULL, NULL),
(29, 'A', 10, 2, 2, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:12:49', NULL, NULL, NULL, 'NewCo is SaaS only solution at this point.', NULL, NULL, NULL),
(30, 'A', 9, 1, 1, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:13:13', NULL, NULL, NULL, 'NewCo is privately owned.', NULL, NULL, NULL),
(31, 'A', 8, 1, 1, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:14:03', NULL, NULL, NULL, 'No, NewCo is now owned by minority or women.', NULL, NULL, NULL),
(32, 'A', 7, 1, 1, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:14:35', NULL, NULL, NULL, 'At the end of CY15, NewCo had about 500 employees.', NULL, NULL, NULL),
(33, 'A', 6, 1, 1, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:14:59', NULL, NULL, NULL, 'https://www.newco.com', NULL, NULL, NULL),
(34, 'A', 5, 1, 1, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:15:31', NULL, NULL, NULL, 'In 2010. Delaware.', NULL, NULL, NULL),
(35, 'A', 4, 1, 1, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:16:01', NULL, NULL, NULL, 'NewCo Incorporated.', NULL, NULL, NULL),
(36, 'C', 19, 4, 4, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:19:52', NULL, NULL, NULL, 'Can you add estimate for FY16', NULL, NULL, NULL),
(37, 'C', 18, 4, 4, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 0, 0, 0, NULL, 0, NULL, 0, '', '2016-09-12 16:20:07', NULL, NULL, NULL, 'Estimate is fine.', NULL, NULL, NULL),
(38, 'A', 11, 2, 2, NULL, NULL, 0, 0, NULL, NULL, 2, NULL, 2130706433, NULL, NULL, 1, 0, 1, NULL, 0, NULL, 0, '', '2016-09-12 16:21:22', NULL, NULL, NULL, 'As of Sept 2016, Windows platform is no longer supported.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qa_posttags`
--

CREATE TABLE IF NOT EXISTS `qa_posttags` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  `postcreated` datetime NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`,`postcreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_posttags`
--

INSERT INTO `qa_posttags` (`postid`, `wordid`, `postcreated`) VALUES
(1, 4, '2016-09-12 15:27:12'),
(1, 5, '2016-09-12 15:27:12'),
(4, 15, '2016-09-12 15:38:16'),
(6, 15, '2016-09-12 15:40:09'),
(7, 15, '2016-09-12 15:40:56'),
(8, 15, '2016-09-12 15:41:51'),
(9, 15, '2016-09-12 15:42:34'),
(10, 48, '2016-09-12 15:43:40'),
(11, 63, '2016-09-12 15:47:21'),
(12, 72, '2016-09-12 15:48:08'),
(13, 72, '2016-09-12 15:50:49'),
(14, 86, '2016-09-12 15:52:43'),
(15, 86, '2016-09-12 15:53:37'),
(16, 92, '2016-09-12 15:54:18'),
(17, 97, '2016-09-12 15:54:53'),
(18, 99, '2016-09-12 15:55:45'),
(23, 92, '2016-09-12 16:04:53');

-- --------------------------------------------------------

--
-- Table structure for table `qa_sharedevents`
--

CREATE TABLE IF NOT EXISTS `qa_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  `lastpostid` int(10) unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  KEY `questionid` (`questionid`,`entitytype`,`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_sharedevents`
--

INSERT INTO `qa_sharedevents` (`entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
('U', 1, 1, 1, NULL, 1, '2016-09-12 15:27:13'),
('T', 5, 1, 1, NULL, 1, '2016-09-12 15:27:13'),
('T', 4, 1, 1, NULL, 1, '2016-09-12 15:27:13'),
('Q', 1, 1, 2, NULL, 2, '2016-09-12 15:29:32'),
('U', 2, 1, 2, NULL, 2, '2016-09-12 15:29:32'),
('Q', 1, 1, 3, 'U', 2, '2016-09-12 15:31:22'),
('U', 2, 1, 3, 'U', 2, '2016-09-12 15:31:22'),
('Q', 1, 1, 1, 'E', 1, '2016-09-12 15:33:11'),
('U', 1, 1, 1, 'E', 1, '2016-09-12 15:33:11'),
('Q', 1, 1, 2, 'E', 2, '2016-09-12 15:33:33'),
('U', 2, 1, 2, 'E', 2, '2016-09-12 15:33:33'),
('Q', 1, 1, 2, 'S', 1, '2016-09-12 15:35:24'),
('U', 1, 1, 2, 'S', 1, '2016-09-12 15:35:24'),
('Q', 4, 4, 4, NULL, 1, '2016-09-12 15:38:17'),
('U', 1, 4, 4, NULL, 1, '2016-09-12 15:38:17'),
('T', 15, 4, 4, NULL, 1, '2016-09-12 15:38:17'),
('Q', 5, 5, 5, NULL, 1, '2016-09-12 15:39:23'),
('U', 1, 5, 5, NULL, 1, '2016-09-12 15:39:23'),
('Q', 6, 6, 6, NULL, 1, '2016-09-12 15:40:10'),
('U', 1, 6, 6, NULL, 1, '2016-09-12 15:40:10'),
('T', 15, 6, 6, NULL, 1, '2016-09-12 15:40:10'),
('Q', 7, 7, 7, NULL, 1, '2016-09-12 15:40:57'),
('U', 1, 7, 7, NULL, 1, '2016-09-12 15:40:57'),
('T', 15, 7, 7, NULL, 1, '2016-09-12 15:40:57'),
('Q', 8, 8, 8, NULL, 1, '2016-09-12 15:41:52'),
('U', 1, 8, 8, NULL, 1, '2016-09-12 15:41:52'),
('T', 15, 8, 8, NULL, 1, '2016-09-12 15:41:52'),
('Q', 9, 9, 9, NULL, 1, '2016-09-12 15:42:35'),
('U', 1, 9, 9, NULL, 1, '2016-09-12 15:42:35'),
('T', 15, 9, 9, NULL, 1, '2016-09-12 15:42:35'),
('Q', 10, 10, 10, NULL, 1, '2016-09-12 15:43:41'),
('U', 1, 10, 10, NULL, 1, '2016-09-12 15:43:41'),
('T', 48, 10, 10, NULL, 1, '2016-09-12 15:43:41'),
('Q', 10, 10, 10, 'A', 1, '2016-09-12 15:46:00'),
('U', 1, 10, 10, 'A', 1, '2016-09-12 15:46:00'),
('C', 2, 10, 10, 'A', 1, '2016-09-12 15:46:00'),
('Q', 11, 11, 11, NULL, 1, '2016-09-12 15:47:22'),
('U', 1, 11, 11, NULL, 1, '2016-09-12 15:47:22'),
('T', 63, 11, 11, NULL, 1, '2016-09-12 15:47:22'),
('C', 2, 11, 11, NULL, 1, '2016-09-12 15:47:22'),
('Q', 12, 12, 12, NULL, 1, '2016-09-12 15:48:09'),
('U', 1, 12, 12, NULL, 1, '2016-09-12 15:48:09'),
('T', 72, 12, 12, NULL, 1, '2016-09-12 15:48:09'),
('C', 2, 12, 12, NULL, 1, '2016-09-12 15:48:09'),
('Q', 13, 13, 13, NULL, 1, '2016-09-12 15:50:50'),
('U', 1, 13, 13, NULL, 1, '2016-09-12 15:50:50'),
('T', 72, 13, 13, NULL, 1, '2016-09-12 15:50:51'),
('C', 2, 13, 13, NULL, 1, '2016-09-12 15:50:51'),
('Q', 14, 14, 14, NULL, 1, '2016-09-12 15:52:44'),
('U', 1, 14, 14, NULL, 1, '2016-09-12 15:52:44'),
('T', 86, 14, 14, NULL, 1, '2016-09-12 15:52:44'),
('C', 2, 14, 14, NULL, 1, '2016-09-12 15:52:44'),
('Q', 15, 15, 15, NULL, 1, '2016-09-12 15:53:38'),
('U', 1, 15, 15, NULL, 1, '2016-09-12 15:53:38'),
('T', 86, 15, 15, NULL, 1, '2016-09-12 15:53:38'),
('C', 2, 15, 15, NULL, 1, '2016-09-12 15:53:38'),
('Q', 16, 16, 16, NULL, 1, '2016-09-12 15:54:19'),
('U', 1, 16, 16, NULL, 1, '2016-09-12 15:54:19'),
('T', 92, 16, 16, NULL, 1, '2016-09-12 15:54:19'),
('C', 3, 16, 16, NULL, 1, '2016-09-12 15:54:19'),
('Q', 17, 17, 17, NULL, 1, '2016-09-12 15:54:55'),
('U', 1, 17, 17, NULL, 1, '2016-09-12 15:54:55'),
('T', 97, 17, 17, NULL, 1, '2016-09-12 15:54:55'),
('C', 3, 17, 17, NULL, 1, '2016-09-12 15:54:55'),
('Q', 18, 18, 18, NULL, 1, '2016-09-12 15:55:46'),
('U', 1, 18, 18, NULL, 1, '2016-09-12 15:55:46'),
('T', 99, 18, 18, NULL, 1, '2016-09-12 15:55:47'),
('C', 4, 18, 18, NULL, 1, '2016-09-12 15:55:47'),
('Q', 18, 18, 19, NULL, 2, '2016-09-12 15:58:33'),
('U', 2, 18, 19, NULL, 2, '2016-09-12 15:58:33'),
('Q', 17, 17, 20, NULL, 2, '2016-09-12 16:01:15'),
('U', 2, 17, 20, NULL, 2, '2016-09-12 16:01:15'),
('Q', 16, 16, 21, NULL, 2, '2016-09-12 16:01:46'),
('U', 2, 16, 21, NULL, 2, '2016-09-12 16:01:46'),
('Q', 15, 15, 22, NULL, 2, '2016-09-12 16:03:40'),
('U', 2, 15, 22, NULL, 2, '2016-09-12 16:03:40'),
('Q', 16, 16, 23, 'F', 1, '2016-09-12 16:04:54'),
('U', 1, 16, 23, 'F', 1, '2016-09-12 16:04:54'),
('Q', 23, 23, 23, NULL, 1, '2016-09-12 16:04:54'),
('U', 1, 23, 23, NULL, 1, '2016-09-12 16:04:54'),
('T', 92, 23, 23, NULL, 1, '2016-09-12 16:04:54'),
('C', 3, 23, 23, NULL, 1, '2016-09-12 16:04:55'),
('Q', 23, 23, 24, NULL, 2, '2016-09-12 16:05:46'),
('U', 2, 23, 24, NULL, 2, '2016-09-12 16:05:46'),
('Q', 14, 14, 25, NULL, 2, '2016-09-12 16:09:22'),
('U', 2, 14, 25, NULL, 2, '2016-09-12 16:09:22'),
('Q', 13, 13, 26, NULL, 2, '2016-09-12 16:10:07'),
('U', 2, 13, 26, NULL, 2, '2016-09-12 16:10:07'),
('Q', 12, 12, 27, NULL, 2, '2016-09-12 16:11:07'),
('U', 2, 12, 27, NULL, 2, '2016-09-12 16:11:07'),
('Q', 11, 11, 28, NULL, 2, '2016-09-12 16:12:22'),
('U', 2, 11, 28, NULL, 2, '2016-09-12 16:12:22'),
('Q', 10, 10, 29, NULL, 2, '2016-09-12 16:12:50'),
('U', 2, 10, 29, NULL, 2, '2016-09-12 16:12:50'),
('Q', 9, 9, 30, NULL, 2, '2016-09-12 16:13:14'),
('U', 2, 9, 30, NULL, 2, '2016-09-12 16:13:14'),
('Q', 8, 8, 31, NULL, 2, '2016-09-12 16:14:04'),
('U', 2, 8, 31, NULL, 2, '2016-09-12 16:14:04'),
('Q', 7, 7, 32, NULL, 2, '2016-09-12 16:14:36'),
('U', 2, 7, 32, NULL, 2, '2016-09-12 16:14:36'),
('Q', 6, 6, 33, NULL, 2, '2016-09-12 16:15:00'),
('U', 2, 6, 33, NULL, 2, '2016-09-12 16:15:00'),
('Q', 5, 5, 34, NULL, 2, '2016-09-12 16:15:32'),
('U', 2, 5, 34, NULL, 2, '2016-09-12 16:15:32'),
('Q', 4, 4, 35, NULL, 2, '2016-09-12 16:16:02'),
('U', 2, 4, 35, NULL, 2, '2016-09-12 16:16:02'),
('Q', 14, 14, 25, 'S', 1, '2016-09-12 16:17:22'),
('U', 1, 14, 25, 'S', 1, '2016-09-12 16:17:22'),
('Q', 18, 18, 36, 'N', 2, '2016-09-12 16:19:53'),
('U', 2, 18, 36, 'N', 2, '2016-09-12 16:19:53'),
('Q', 18, 18, 37, 'U', 2, '2016-09-12 16:20:07'),
('U', 2, 18, 37, 'U', 2, '2016-09-12 16:20:07'),
('Q', 11, 11, 38, NULL, 2, '2016-09-12 16:21:23'),
('U', 2, 11, 38, NULL, 2, '2016-09-12 16:21:23'),
('Q', 11, 11, 28, 'S', 1, '2016-09-12 16:21:54'),
('U', 1, 11, 28, 'S', 1, '2016-09-12 16:21:54');

-- --------------------------------------------------------

--
-- Table structure for table `qa_tagmetas`
--

CREATE TABLE IF NOT EXISTS `qa_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`tag`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_tagwords`
--

CREATE TABLE IF NOT EXISTS `qa_tagwords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_tagwords`
--

INSERT INTO `qa_tagwords` (`postid`, `wordid`) VALUES
(1, 5),
(1, 4),
(4, 15),
(6, 15),
(7, 15),
(8, 15),
(9, 15),
(10, 48),
(11, 56),
(11, 62),
(12, 64),
(12, 71),
(13, 64),
(13, 71),
(14, 64),
(14, 85),
(15, 64),
(15, 85),
(16, 88),
(16, 91),
(17, 88),
(17, 94),
(18, 99),
(23, 88),
(23, 91);

-- --------------------------------------------------------

--
-- Table structure for table `qa_titlewords`
--

CREATE TABLE IF NOT EXISTS `qa_titlewords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_titlewords`
--

INSERT INTO `qa_titlewords` (`postid`, `wordid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(4, 15),
(4, 16),
(5, 15),
(5, 19),
(6, 15),
(6, 24),
(7, 15),
(7, 27),
(8, 32),
(8, 33),
(9, 15),
(9, 43),
(10, 46),
(10, 47),
(11, 54),
(11, 50),
(12, 64),
(12, 65),
(12, 7),
(12, 66),
(13, 73),
(13, 50),
(14, 64),
(14, 79),
(15, 50),
(15, 87),
(16, 88),
(16, 89),
(17, 93),
(17, 94),
(18, 98),
(18, 99),
(23, 135),
(23, 80),
(23, 88),
(23, 89);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userevents`
--

CREATE TABLE IF NOT EXISTS `qa_userevents` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  `lastpostid` int(10) unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) unsigned DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `userid` (`userid`,`updated`),
  KEY `questionid` (`questionid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userevents`
--

INSERT INTO `qa_userevents` (`userid`, `entitytype`, `entityid`, `questionid`, `lastpostid`, `updatetype`, `lastuserid`, `updated`) VALUES
(1, '-', 0, 1, 2, NULL, 2, '2016-09-12 15:29:32'),
(1, '-', 0, 1, 3, 'U', 2, '2016-09-12 15:31:22'),
(2, '-', 0, 1, 2, 'S', 1, '2016-09-12 15:35:24'),
(1, '-', 0, 18, 19, NULL, 2, '2016-09-12 15:58:33'),
(1, '-', 0, 17, 20, NULL, 2, '2016-09-12 16:01:15'),
(1, '-', 0, 16, 21, NULL, 2, '2016-09-12 16:01:46'),
(1, '-', 0, 15, 22, NULL, 2, '2016-09-12 16:03:40'),
(2, '-', 0, 16, 23, 'F', 1, '2016-09-12 16:04:54'),
(1, '-', 0, 23, 24, NULL, 2, '2016-09-12 16:05:46'),
(1, '-', 0, 14, 25, NULL, 2, '2016-09-12 16:09:22'),
(1, '-', 0, 13, 26, NULL, 2, '2016-09-12 16:10:07'),
(1, '-', 0, 12, 27, NULL, 2, '2016-09-12 16:11:07'),
(1, '-', 0, 11, 28, NULL, 2, '2016-09-12 16:12:22'),
(1, '-', 0, 10, 29, NULL, 2, '2016-09-12 16:12:50'),
(1, '-', 0, 9, 30, NULL, 2, '2016-09-12 16:13:14'),
(1, '-', 0, 8, 31, NULL, 2, '2016-09-12 16:14:04'),
(1, '-', 0, 7, 32, NULL, 2, '2016-09-12 16:14:36'),
(1, '-', 0, 6, 33, NULL, 2, '2016-09-12 16:15:00'),
(1, '-', 0, 5, 34, NULL, 2, '2016-09-12 16:15:32'),
(1, '-', 0, 4, 35, NULL, 2, '2016-09-12 16:16:02'),
(2, '-', 0, 14, 25, 'S', 1, '2016-09-12 16:17:22'),
(2, 'T', 15, 4, 4, NULL, 1, '2016-09-12 15:38:17'),
(2, 'T', 15, 6, 6, NULL, 1, '2016-09-12 15:40:10'),
(2, 'T', 15, 7, 7, NULL, 1, '2016-09-12 15:40:57'),
(2, 'T', 15, 8, 8, NULL, 1, '2016-09-12 15:41:52'),
(2, 'T', 15, 9, 9, NULL, 1, '2016-09-12 15:42:35'),
(2, 'Q', 13, 13, 13, NULL, 1, '2016-09-12 15:50:50'),
(2, 'Q', 13, 13, 26, NULL, 2, '2016-09-12 16:10:07'),
(2, 'C', 4, 18, 18, NULL, 1, '2016-09-12 15:55:47'),
(1, '-', 0, 18, 37, 'U', 2, '2016-09-12 16:20:07'),
(1, '-', 0, 11, 38, NULL, 2, '2016-09-12 16:21:23'),
(2, '-', 0, 11, 28, 'S', 1, '2016-09-12 16:21:54');

-- --------------------------------------------------------

--
-- Table structure for table `qa_userfavorites`
--

CREATE TABLE IF NOT EXISTS `qa_userfavorites` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `nouserevents` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  KEY `userid` (`userid`,`nouserevents`),
  KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userfavorites`
--

INSERT INTO `qa_userfavorites` (`userid`, `entitytype`, `entityid`, `nouserevents`) VALUES
(2, 'C', 4, 0),
(2, 'Q', 13, 0),
(2, 'T', 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userfields`
--

CREATE TABLE IF NOT EXISTS `qa_userfields` (
  `fieldid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` varchar(40) DEFAULT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  `permit` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`fieldid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `qa_userfields`
--

INSERT INTO `qa_userfields` (`fieldid`, `title`, `content`, `position`, `flags`, `permit`) VALUES
(1, 'name', NULL, 1, 0, NULL),
(2, 'location', NULL, 2, 0, NULL),
(3, 'website', NULL, 3, 2, NULL),
(4, 'about', NULL, 4, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlevels`
--

CREATE TABLE IF NOT EXISTS `qa_userlevels` (
  `userid` int(10) unsigned NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `level` tinyint(3) unsigned DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  KEY `entitytype` (`entitytype`,`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlimits`
--

CREATE TABLE IF NOT EXISTS `qa_userlimits` (
  `userid` int(10) unsigned NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `userid` (`userid`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userlimits`
--

INSERT INTO `qa_userlimits` (`userid`, `action`, `period`, `count`) VALUES
(1, 'Q', 409367, 1),
(1, 'V', 409367, 1),
(1, 'W', 409367, 1),
(2, 'A', 409367, 16),
(2, 'C', 409367, 2),
(2, 'U', 409367, 1),
(2, 'V', 409367, 2);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userlogins`
--

CREATE TABLE IF NOT EXISTS `qa_userlogins` (
  `userid` int(10) unsigned NOT NULL,
  `source` varchar(16) CHARACTER SET ascii NOT NULL,
  `identifier` varbinary(1024) NOT NULL,
  `identifiermd5` binary(16) NOT NULL,
  KEY `source` (`source`,`identifiermd5`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_usermetas`
--

CREATE TABLE IF NOT EXISTS `qa_usermetas` (
  `userid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`userid`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `qa_usernotices`
--

CREATE TABLE IF NOT EXISTS `qa_usernotices` (
  `noticeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `content` varchar(8000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`noticeid`),
  KEY `userid` (`userid`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `qa_userpoints`
--

CREATE TABLE IF NOT EXISTS `qa_userpoints` (
  `userid` int(10) unsigned NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userpoints`
--

INSERT INTO `qa_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `qvoteds`, `avoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
(1, 550, 17, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 1, 1, 0),
(2, 1780, 0, 18, 3, 0, 3, 1, 1, 0, 0, 0, 4, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_userprofile`
--

CREATE TABLE IF NOT EXISTS `qa_userprofile` (
  `userid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  UNIQUE KEY `userid` (`userid`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_userprofile`
--

INSERT INTO `qa_userprofile` (`userid`, `title`, `content`) VALUES
(2, 'about', 'I do stuff ..'),
(2, 'location', 'Sunnyvale'),
(2, 'name', 'Durgam Vahia'),
(2, 'website', 'www.nimeyo.com');

-- --------------------------------------------------------

--
-- Table structure for table `qa_users`
--

CREATE TABLE IF NOT EXISTS `qa_users` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `createip` int(10) unsigned NOT NULL,
  `email` varchar(80) NOT NULL,
  `handle` varchar(20) NOT NULL,
  `avatarblobid` bigint(20) unsigned DEFAULT NULL,
  `avatarwidth` smallint(5) unsigned DEFAULT NULL,
  `avatarheight` smallint(5) unsigned DEFAULT NULL,
  `passsalt` binary(16) DEFAULT NULL,
  `passcheck` binary(20) DEFAULT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `loggedin` datetime NOT NULL,
  `loginip` int(10) unsigned NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` int(10) unsigned DEFAULT NULL,
  `emailcode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessioncode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessionsource` varchar(16) CHARACTER SET ascii DEFAULT '',
  `flags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `wallposts` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `email` (`email`),
  KEY `handle` (`handle`),
  KEY `level` (`level`),
  KEY `created` (`created`,`level`,`flags`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `qa_users`
--

INSERT INTO `qa_users` (`userid`, `created`, `createip`, `email`, `handle`, `avatarblobid`, `avatarwidth`, `avatarheight`, `passsalt`, `passcheck`, `level`, `loggedin`, `loginip`, `written`, `writeip`, `emailcode`, `sessioncode`, `sessionsource`, `flags`, `wallposts`) VALUES
(1, '2016-09-09 12:14:57', 2130706433, 'test@test.com', 'admin', NULL, NULL, NULL, 'es9wu2474yzyxcpp', '"h­ðæp¾-ÈâàE7î©ð:è', 120, '2016-09-09 12:14:58', 2130706433, '2016-09-12 16:21:57', 2130706433, '', 'gg0joc43', NULL, 0, 0),
(2, '2016-09-12 15:28:39', 2130706433, 'dvahia@yahoo.com', 'dv', 5951803006649220091, 109, 45, '36xvvr2xm6dwc36i', '.gZ ƒâ5k>ˆ€a>s›Ã', 0, '2016-09-12 15:28:40', 2130706433, '2016-09-12 16:28:47', 2130706433, 'mylqc0vx', 'q62xyl13', NULL, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `qa_uservotes`
--

CREATE TABLE IF NOT EXISTS `qa_uservotes` (
  `postid` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  UNIQUE KEY `userid` (`userid`,`postid`),
  KEY `postid` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa_uservotes`
--

INSERT INTO `qa_uservotes` (`postid`, `userid`, `vote`, `flag`) VALUES
(2, 1, 1, 0),
(38, 1, 1, 0),
(12, 2, -1, 0),
(16, 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `qa_widgets`
--

CREATE TABLE IF NOT EXISTS `qa_widgets` (
  `widgetid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL,
  PRIMARY KEY (`widgetid`),
  UNIQUE KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `qa_words`
--

CREATE TABLE IF NOT EXISTS `qa_words` (
  `wordid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) unsigned NOT NULL DEFAULT '0',
  `contentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `tagwordcount` int(10) unsigned NOT NULL DEFAULT '0',
  `tagcount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wordid`),
  KEY `word` (`word`),
  KEY `tagcount` (`tagcount`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=185 ;

--
-- Dumping data for table `qa_words`
--

INSERT INTO `qa_words` (`wordid`, `word`, `titlecount`, `contentcount`, `tagwordcount`, `tagcount`) VALUES
(1, 'is', 1, 18, 0, 0),
(2, 'this', 1, 4, 0, 0),
(3, 'a', 1, 3, 0, 0),
(4, 'test', 1, 1, 1, 1),
(5, 'first', 0, 1, 1, 1),
(6, 'question', 0, 2, 0, 0),
(7, 'and', 1, 6, 0, 0),
(8, 'the', 0, 9, 0, 0),
(9, 'really', 0, 1, 0, 0),
(10, 'edit', 0, 1, 0, 0),
(11, 'made', 0, 1, 0, 0),
(12, 'it', 0, 3, 0, 0),
(13, 'real', 0, 1, 0, 0),
(14, 'yes', 0, 5, 0, 0),
(15, 'company', 5, 7, 5, 5),
(16, 'name', 1, 1, 0, 0),
(17, 'what', 0, 4, 0, 0),
(18, 'your', 0, 9, 0, 0),
(19, 'incorporation', 1, 0, 0, 0),
(20, 'when', 0, 1, 0, 0),
(21, 'was', 0, 1, 0, 0),
(22, 'incorporated', 0, 2, 0, 0),
(23, 'where', 0, 2, 0, 0),
(24, 'website', 1, 1, 0, 0),
(25, 'url', 0, 1, 0, 0),
(26, 'of', 0, 6, 0, 0),
(27, 'employees', 1, 2, 0, 0),
(28, 'how', 0, 2, 0, 0),
(29, 'many', 0, 1, 0, 0),
(30, 'does', 0, 6, 0, 0),
(31, 'employ', 0, 1, 0, 0),
(32, 'business', 1, 1, 0, 0),
(33, 'details', 1, 1, 0, 0),
(34, 'classified', 0, 1, 0, 0),
(35, 'as', 0, 2, 0, 0),
(36, 'small', 0, 1, 0, 0),
(37, 'minority', 0, 2, 0, 0),
(38, 'or', 0, 3, 0, 0),
(39, 'women', 0, 2, 0, 0),
(40, 'owned', 0, 4, 0, 0),
(41, 'please', 0, 1, 0, 0),
(42, 'provide', 0, 1, 0, 0),
(43, 'ownership', 1, 0, 0, 0),
(44, 'privately', 0, 2, 0, 0),
(45, 'public', 0, 1, 0, 0),
(46, 'solution', 1, 2, 0, 0),
(47, 'type', 1, 0, 0, 0),
(48, 'saas', 0, 2, 1, 1),
(49, 'based', 0, 1, 0, 0),
(50, 'support', 3, 4, 0, 0),
(51, 'on', 0, 1, 0, 0),
(52, 'premises', 0, 1, 0, 0),
(53, 'deployment', 0, 1, 0, 0),
(54, 'mobility', 1, 0, 0, 0),
(55, 'which', 0, 2, 0, 0),
(56, 'mobile', 0, 1, 1, 0),
(57, 'operating', 0, 1, 0, 0),
(58, 'systems', 0, 1, 0, 0),
(59, 'are', 0, 4, 0, 0),
(60, 'supported', 0, 4, 0, 0),
(61, 'by', 0, 2, 0, 0),
(62, 'os', 0, 0, 1, 0),
(63, 'mobile-os', 0, 0, 0, 1),
(64, 'user', 2, 0, 4, 0),
(65, 'creation', 1, 3, 0, 0),
(66, 'provisioning', 1, 0, 0, 0),
(67, 'cloud', 0, 5, 0, 0),
(68, 'platform', 0, 7, 0, 0),
(69, 'local', 0, 1, 0, 0),
(70, 'users', 0, 1, 0, 0),
(71, 'management', 0, 1, 2, 0),
(72, 'user-management', 0, 0, 0, 2),
(73, 'directory', 1, 1, 0, 0),
(74, 'integrate', 0, 1, 0, 0),
(75, 'with', 0, 2, 0, 0),
(76, 'ldap', 0, 2, 0, 0),
(77, 'services', 0, 3, 0, 0),
(78, 'ones', 0, 1, 0, 0),
(79, 'partitions', 1, 2, 0, 0),
(80, 'to', 1, 5, 0, 0),
(81, 'create', 0, 2, 0, 0),
(82, 'separate', 0, 3, 0, 0),
(83, 'groups', 0, 1, 0, 0),
(84, 'for', 0, 5, 0, 0),
(85, 'administration', 0, 1, 2, 0),
(86, 'user-administration', 0, 0, 0, 2),
(87, 'delegation', 1, 1, 0, 0),
(88, 'data', 2, 5, 3, 0),
(89, 'centers', 2, 3, 0, 0),
(90, 'located', 0, 1, 0, 0),
(91, 'center', 0, 1, 2, 0),
(92, 'data-center', 0, 0, 0, 2),
(93, 'physical', 1, 1, 0, 0),
(94, 'security', 1, 1, 1, 0),
(95, 'secured', 0, 1, 0, 0),
(96, 'physically', 0, 1, 0, 0),
(97, 'data-security', 0, 0, 0, 1),
(98, 'recurring', 1, 1, 0, 0),
(99, 'revenue', 1, 1, 1, 1),
(100, 'annual', 0, 1, 0, 0),
(101, '100m', 0, 1, 0, 0),
(102, 'usd', 0, 1, 0, 0),
(103, 'fy15', 0, 1, 0, 0),
(104, 'all', 0, 1, 0, 0),
(105, 'customer', 0, 1, 0, 0),
(106, 'product', 0, 1, 0, 0),
(107, 'hosted', 0, 1, 0, 0),
(108, 'in', 0, 4, 0, 0),
(109, 'highly', 0, 1, 0, 0),
(110, 'secure', 0, 1, 0, 0),
(111, '24x7', 0, 1, 0, 0),
(112, 'requires', 0, 1, 0, 0),
(113, 'multi', 0, 1, 0, 0),
(114, 'factor', 0, 1, 0, 0),
(115, 'id', 0, 1, 0, 0),
(116, 'biometrics', 0, 1, 0, 0),
(117, 'password', 0, 1, 0, 0),
(118, 'authentication', 0, 1, 0, 0),
(119, 'access', 0, 1, 0, 0),
(120, 'premise', 0, 1, 0, 0),
(121, 'under', 0, 1, 0, 0),
(122, 'video', 0, 1, 0, 0),
(123, 'surveillance', 0, 1, 0, 0),
(124, 'united', 0, 1, 0, 0),
(125, 'states', 0, 1, 0, 0),
(126, 'russia', 0, 1, 0, 0),
(127, 'administrators', 0, 1, 0, 0),
(128, 'each', 0, 1, 0, 0),
(129, 'partition', 0, 1, 0, 0),
(130, 'may', 0, 1, 0, 0),
(131, 'configuration', 0, 1, 0, 0),
(132, 'policies', 0, 1, 0, 0),
(133, 'apply', 0, 1, 0, 0),
(134, 'that', 0, 2, 0, 0),
(135, 'update', 1, 0, 0, 0),
(136, 'so', 0, 1, 0, 0),
(137, 'expansion', 0, 1, 0, 0),
(138, 'plan', 0, 1, 0, 0),
(139, 'cy16', 0, 1, 0, 0),
(140, 'plans', 0, 1, 0, 0),
(141, 'build', 0, 1, 0, 0),
(142, 'emea', 0, 1, 0, 0),
(143, 'latam', 0, 1, 0, 0),
(144, 'supports', 0, 2, 0, 0),
(145, 'used', 0, 1, 0, 0),
(146, 'into', 0, 1, 0, 0),
(147, 'independently', 0, 1, 0, 0),
(148, 'managed', 0, 1, 0, 0),
(149, 'entities', 0, 1, 0, 0),
(150, 'common', 0, 1, 0, 0),
(151, 'directories', 0, 1, 0, 0),
(152, 'feature', 0, 1, 0, 0),
(153, 'newco', 0, 7, 0, 0),
(154, 'apps', 0, 1, 0, 0),
(155, 'content', 0, 1, 0, 0),
(156, 'devices', 0, 1, 0, 0),
(157, 'running', 0, 1, 0, 0),
(158, 'ios', 0, 1, 0, 0),
(159, 'android', 0, 1, 0, 0),
(160, 'windows', 0, 2, 0, 0),
(161, 'only', 0, 1, 0, 0),
(162, 'at', 0, 2, 0, 0),
(163, 'point', 0, 1, 0, 0),
(164, 'no', 0, 2, 0, 0),
(165, 'now', 0, 1, 0, 0),
(166, 'end', 0, 1, 0, 0),
(167, 'cy15', 0, 1, 0, 0),
(168, 'had', 0, 1, 0, 0),
(169, 'about', 0, 1, 0, 0),
(170, '500', 0, 1, 0, 0),
(171, 'https', 0, 1, 0, 0),
(172, 'www', 0, 1, 0, 0),
(173, 'com', 0, 1, 0, 0),
(174, '2010', 0, 1, 0, 0),
(175, 'delaware', 0, 1, 0, 0),
(176, 'can', 0, 1, 0, 0),
(177, 'you', 0, 1, 0, 0),
(178, 'add', 0, 1, 0, 0),
(179, 'estimate', 0, 2, 0, 0),
(180, 'fy16', 0, 1, 0, 0),
(181, 'fine', 0, 1, 0, 0),
(182, 'sept', 0, 1, 0, 0),
(183, '2016', 0, 1, 0, 0),
(184, 'longer', 0, 1, 0, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `qa_categorymetas`
--
ALTER TABLE `qa_categorymetas`
  ADD CONSTRAINT `qa_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_contentwords`
--
ALTER TABLE `qa_contentwords`
  ADD CONSTRAINT `qa_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_postmetas`
--
ALTER TABLE `qa_postmetas`
  ADD CONSTRAINT `qa_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_posts`
--
ALTER TABLE `qa_posts`
  ADD CONSTRAINT `qa_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_posts` (`postid`),
  ADD CONSTRAINT `qa_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_posts` (`postid`),
  ADD CONSTRAINT `qa_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL;

--
-- Constraints for table `qa_posttags`
--
ALTER TABLE `qa_posttags`
  ADD CONSTRAINT `qa_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_tagwords`
--
ALTER TABLE `qa_tagwords`
  ADD CONSTRAINT `qa_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_titlewords`
--
ALTER TABLE `qa_titlewords`
  ADD CONSTRAINT `qa_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Constraints for table `qa_userevents`
--
ALTER TABLE `qa_userevents`
  ADD CONSTRAINT `qa_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userfavorites`
--
ALTER TABLE `qa_userfavorites`
  ADD CONSTRAINT `qa_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlevels`
--
ALTER TABLE `qa_userlevels`
  ADD CONSTRAINT `qa_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlimits`
--
ALTER TABLE `qa_userlimits`
  ADD CONSTRAINT `qa_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userlogins`
--
ALTER TABLE `qa_userlogins`
  ADD CONSTRAINT `qa_userlogins_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_usermetas`
--
ALTER TABLE `qa_usermetas`
  ADD CONSTRAINT `qa_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  ADD CONSTRAINT `qa_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_userprofile`
--
ALTER TABLE `qa_userprofile`
  ADD CONSTRAINT `qa_userprofile_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Constraints for table `qa_uservotes`
--
ALTER TABLE `qa_uservotes`
  ADD CONSTRAINT `qa_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
