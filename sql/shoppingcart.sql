-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 13, 2020 at 03:59 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shoppingcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `aboutus`
--

CREATE TABLE IF NOT EXISTS `aboutus` (
  `about` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aboutus`
--

INSERT INTO `aboutus` (`about`) VALUES
('<p><img Style="MARGIN-RIGHT: 10px" Height="300" Width="300" Align="left" Src="/userfiles/image/about-us-vector-32.png" Alt="" /></p>\r\n<h1><span Style="color: Rgb(0, 0, 255);">About Us</span></h1>\r\n<blockquote>\r\n<address><span Style="font-family: Verdana;">about Us</span></address>\r\n</blockquote>');

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE IF NOT EXISTS `adminlogin` (
  `adminlogin_id` int(11) NOT NULL AUTO_INCREMENT,
  `adminlogin_username` varchar(20) NOT NULL,
  `adminlogin_password` varchar(20) NOT NULL,
  `adminlogin_department` int(11) NOT NULL,
  `adminlogin_status` enum('0','1') NOT NULL DEFAULT '1',
  `adminlogin_addeddate` date NOT NULL,
  `adminlogin_addedtime` time NOT NULL,
  PRIMARY KEY (`adminlogin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`adminlogin_id`, `adminlogin_username`, `adminlogin_password`, `adminlogin_department`, `adminlogin_status`, `adminlogin_addeddate`, `adminlogin_addedtime`) VALUES
(1, 'admin', 'admin', 1, '1', '2020-03-30', '13:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_image` varchar(50) NOT NULL,
  `banner_link` text NOT NULL,
  `banner_status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `banner_image`, `banner_link`, `banner_status`) VALUES
(1, 'banner_image_1.jpg', '#1', '1'),
(2, 'banner_image_2.jpg', '#2', '1'),
(3, 'banner_image_3.jpg', '#3', '1'),
(4, 'banner_image_4.jpg', '#4', '1');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `category_status` enum('0','1') NOT NULL DEFAULT '1',
  `category_image` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_status`, `category_image`) VALUES
(1, 'BirthDay Cakes', '1', 'category_image_1.jpg'),
(2, 'Black Forest', '1', 'category_image_2.jpg'),
(3, 'Anniversary Cakes', '1', 'category_image_3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `contact` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact`) VALUES
('<p>contact</p>');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(20) NOT NULL,
  `department_status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`department_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `department_status`) VALUES
(1, 'Super Admin', '1'),
(2, 'billing', '1'),
(3, 'delivery', '1'),
(4, 'admin', '1');

-- --------------------------------------------------------

--
-- Table structure for table `disclaimer`
--

CREATE TABLE IF NOT EXISTS `disclaimer` (
  `disclaimer` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disclaimer`
--

INSERT INTO `disclaimer` (`disclaimer`) VALUES
('<p><img Style="MARGIN-RIGHT: 10px" Height="512" Width="512" Align="left" Src="/userfiles/image/Disclaimer-Symbol-PNG.png" Alt="" /></p>\r\n<h3>Disclaimer</h3>\r\n<p>&nbsp;</p>\r\n<p>Disclaimer</p>');

-- --------------------------------------------------------

--
-- Table structure for table `privacypolicy`
--

CREATE TABLE IF NOT EXISTS `privacypolicy` (
  `privacypolicy` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `privacypolicy`
--

INSERT INTO `privacypolicy` (`privacypolicy`) VALUES
('<h1><span Style="color: Rgb(0, 0, 255);"> Privacy Policy </span></h1>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<div>Protecting Your Privacy Is Very Important To Us. We Have  Accordingly Developed This Privacy Policy To Protect Your Personal  Information And Keep It Confidential. We Endeavor To Comply With Laws Of  Other Countries But Cannot And Do Not Warrant That We Do. We Do  Everything We Reasonably Can To Protect Your Rights Of Privacy On  Systems And The Website Controlled By Us, But We Are Not Liable For Any  Unauthorised Or Unlawful Disclosures Of Your Personal And Confidential  Information Made By Third Parties Who Are Not Subject To Our Control,  For Example Advertisers And Websites That Have Links To Our Website. You  Should Take Note That The Information And Privacy Practices Of Our  Business Partners, Advertisers, Sponsors Or Other Sites To Which We  Provide Hyperlinks, May Be Different From Ours.</div>\r\n<div>&nbsp;</div>\r\n<div>We Want You To</div>\r\n<div>&nbsp;</div>\r\n<div>&bull; Feel Comfortable Using Our Web Sites</div>\r\n<div>&nbsp;</div>\r\n<div>&bull; Feel Secure Submitting Information To Us</div>\r\n<div>&nbsp;</div>\r\n<div>&bull; Contact Us With Your Questions Or Concerns About Privacy On This Site</div>\r\n<div>&nbsp;</div>\r\n<div>&bull; Know That By Using Our Sites You Are Consenting To The Collection Of Certain Data</div>\r\n<div>&nbsp;</div>\r\n<div>We Categorise Information About You (collectively Referred To As &quot;Personal Information&quot;) As Follows:</div>\r\n<div>&nbsp;</div>\r\n<div>(a) Profiling Information: Information Which You Provide When You  Register For A Service, Which May Include Some Or All Of The Following:</div>\r\n<div>&nbsp;</div>\r\n<div>- Information About Your Personal Identity Such As Gender, Marital Status, Age Etc.;</div>\r\n<div>&nbsp;</div>\r\n<div>- Your Financial Information Such As Your Banking Details And Any Information Relating To Your Income And Lifestyle Levels; And</div>\r\n<div>&nbsp;</div>\r\n<div>- Your Contact Details Such As Your Physical Addresses, Postal Addresses, Telephone And Fax Numbers And The Like.</div>\r\n<div>&nbsp;</div>\r\n<div>(b) Payment And Account Information: Your Account History With Us  Including (without Limitation) All Billing Information And  Communications, Payment History Etc. We Maintain This In Encrypted Form  On Secure Servers.</div>\r\n<div>&nbsp;</div>\r\n<div>(c) Service Usage: Information About Your Navigation Using Our  Services, For Example The URLs Of Websites, Which You Visit And From  Which You Request Downloads.</div>\r\n<div>&nbsp;</div>\r\n<div>(d) Log Information: Information Such As Your Web Request, IP Address, Browser Type, Browser Language, Date And Time Of Request.</div>\r\n<div>&nbsp;</div>\r\n<div>(e) Transactional Information: Transactional History (other Than Banking Details) About Your E-commerce Activities.</div>\r\n<div>&nbsp;</div>\r\n<div>(f) Correspondence Information: Content, Information About Your  Correspondents, And The Destination/origin Of Communications Between You  And Any Other Person Using Our Services, Which Include Email  Communications, Blog, Chat Room And Discussion Board Communications,  Instant Message Communications, Experts Forum Communications, Faxmail  Communications, Membership Of Mailing Lists Etc.</div>\r\n<div>&nbsp;</div>\r\n<div>(g) User IDs: Your Usernames, Passwords, Email Addresses And Other  Security-related Information Used By You In Relation To Our Services.</div>\r\n<div>&nbsp;</div>\r\n<div>(h) Stored Information: Data Either Created By You Or By A Third  Party And Which You Wish To Store On Our Servers Such As Image Files,  Documents Etc.</div>\r\n<div>&nbsp;</div>\r\n<div>We Only Collect Your Personal Information To Conduct Our Business  And To Enable Us To Deliver And Improve Our Services. We Do Not For Any  Reason Whatsoever Sell Your Personal Information To Any Third Party Or  Otherwise Trade On It.</div>\r\n<div>&nbsp;</div>\r\n<div>We Will Only Disclose Your Personal Information In Accordance With  This Privacy Policy. If We Want To Use It For Any Other Purpose, We Will  Obtain Your Prior Written Consent.</div>\r\n<div>&nbsp;</div>\r\n<div>If You Decline To Submit Personal Information To Us, Then We Will  Unfortunately Not Be In A Position To Provide The Services To You.</div>\r\n<div>&nbsp;</div>\r\n<div>Any Of Your Information Which You Provide When You Use Certain  Services And Are To An Open, Public Environment Or Forum Including  (without Limitation) Any Blog, Community Or Discussion Board, Is Not  Confidential, Does Not Constitute Personal Information, And Is Not  Subject To Protection Under Privacy Policy.</div>\r\n<div>&nbsp;</div>\r\n<div>Since Such Public Environments Are Accessible By Third Parties, It  Is Possible That Third Parties May Collect And Collate And Use Such  Information For Their Own Purposes. You Should Accordingly Be Careful  When Deciding To Share Any Of Your Personal Information In Such Public  Environments.</div>\r\n<div>&nbsp;</div>\r\n<div>Information, Which Is Disclosed Publicly, Is Also Shared With Our  Affiliates, Third Party Service Providers, Sponsors Of Competitions Etc.  Unless Expressly Stated Otherwise.</div>\r\n<div>&nbsp;</div>\r\n<div>We Are Not Liable To You Or Any Third Party For Any Damages That  You Or Any Third Party May Suffer Howsoever Arising From Your Disclosure  Of Personal Information In Any Public Environment. You Accordingly  Disclose Information In A Public Environment At Your Own Risk.</div>\r\n<div>&nbsp;</div>\r\n<h1>RIGHT TO COLLECT</h1>\r\n<div>&nbsp;</div>\r\n<div>By Accepting The Terms Of Service You Agree That We May Collect And  Store Your Personal Information As Long As You Use Our Services Subject  To The Limitations Set Out In This Privacy Policy.</div>\r\n<div>&nbsp;</div>\r\n<div>2.1 We Collect Your Profiling And Account Information For The Following Reasons:</div>\r\n<div>&nbsp;</div>\r\n<div>(a) We Need Your Identity Details, Contact Details, Banking  Information And Account History To Manage Our Relationship With You And  Provide Services To You. We Will Only Disclose This Information As  Provided Below.</div>\r\n<div>&nbsp;</div>\r\n<div>(b) We Use Certain Of Your Information In An Aggregated Form To  Compile Statistical And Demographical Profiles For Our Business And  Marketing Activities. We May Disclose Such Information About You,  Provided That The Information Is In An Aggregated Form That Is Not  Capable Of Being Used Or Interpreted In Such A Manner As To Identify  You.</div>\r\n<div>&nbsp;</div>\r\n<div>2.2 We Collect And Store Your Service Usage And Transactional Information To:</div>\r\n<div>&nbsp;</div>\r\n<div>(a) Determine And Verify The Service Charges Payable By You And To Administer Our Relationship With You.</div>\r\n<div>&nbsp;</div>\r\n<div>(b) Comply With Any Statutory Or Regulatory Requirement.</div>\r\n<div>&nbsp;</div>\r\n<div>(c) Compile Statistical And Demographical Profiles About You For  Our Business And Marketing Activities And To Customise Our Services To  You. While We Are Entitled To Use Such Information About You For Our Own  Internal Business Purposes Without Limitation, We Will Only Disclose It  In An Aggregated Form Which Is Not Capable Of Being Used Or Interpreted  In Such A Manner As To Identify You; And</div>\r\n<div>&nbsp;</div>\r\n<div>(d) Monitor Your Use Of Our Services For The Purposes Of Ensuring Compliance With Our Terms Of Service.</div>\r\n<div>&nbsp;</div>\r\n<div>2.3 We Collect And Store Your Correspondence Information And Personal Identifiers To:</div>\r\n<div>&nbsp;</div>\r\n<div>(a) Comply With Our Obligations Under Law; And</div>\r\n<div>&nbsp;</div>\r\n<div>(b) Monitor Your Use Of Our Services In Order To Ensure Your Compliance With Our Terms Of Service.</div>\r\n<div>&nbsp;</div>\r\n<div>Any Personal Information Which We Collect And Which We May Use In  An Aggregated Format Ensuring You Are Not Individually Identified Is Our  Property. We May Use It, In Our Sole Discretion And Without Any  Compensation To You, For Any Legitimate Purpose Including (without  Limitation) The Commercial Sale Thereof To Third Parties.</div>\r\n<div>&nbsp;</div>\r\n<div>Sometime We Use &quot;cookies&quot; So That We Can Provide You With More  Customised Information When You Return To Our Website. &quot;Cookies&quot; Are  Used To Store User Preferences And To Track User Trends, So As To  Enhance Your Interactive Experience And Generally Improve Our Services  To You. You Can Set Your Browser To Notify You When You Are Sent A  &quot;cookie&quot;, Giving You The Chance To Decide Whether Or Not To Accept It.  If You Do Accept A &quot;cookie&quot;, You Thereby Agree To Our Use Of Any  Personal Information Collected By Us Using That Cookie.</div>\r\n<div>&nbsp;</div>\r\n<div>You May Update Your Profiling Information At Any Time On The Website.</div>\r\n<div>&nbsp;</div>\r\n<div>You Acknowledge And Agree That In The Interests Of Improving  Personalisation And Service Efficiency, We May, Under Controlled And  Secure Circumstances, Share Your Personal Information With Our  Affiliates (an Entity Which Is Our Subsidiary Or Holding Company Or A  Subsidiary Of Our Holding Company Or An Entity Which Controls, Is  Controlled By Or Is Under Common Control With Us).</div>\r\n<div>&nbsp;</div>\r\n<h1>GENERAL EXCEPTIONS</h1>\r\n<div>&nbsp;</div>\r\n<div>If We Are Required To Intercept, Disclose, Monitor And/or Store Your Personal Information:</div>\r\n<div>&nbsp;</div>\r\n<div>(a) By Law;</div>\r\n<div>&nbsp;</div>\r\n<div>(b) To Conduct Our Business;</div>\r\n<div>&nbsp;</div>\r\n<div>(c) To Secure Our Systems; Or</div>\r\n<div>&nbsp;</div>\r\n<div>(d) To Enforce Our Own Rights,</div>\r\n<div>&nbsp;</div>\r\n<div>we Will Do So In The Manner As Prescribed By Law.</div>\r\n<div>&nbsp;</div>\r\n<div>Such Interception, Disclosure, Monitoring And Storage May Take  Place Without Your Knowledge. In That Case, We Will Not Be Liable To You  Or Any Third Party For Any Damages Howsoever Arising From Such  Interception, Disclosure, Monitoring And Storage. In Order To Ensure  That All Our Users Comply With The Terms Of Service, We May Monitor Your  Personal Information To The Extent That This May Be Required To  Determine Compliance And/or To Identify Instances Of Non-compliance. To  Ensure That The Security And Integrity Of Our Services Are Safeguarded,  We May Monitor Your Personal Information. This Monitoring May Include  (without Limitation) The Filtering Of Incoming And Outgoing Electronic  Data Messages To Identify, Limit And/or Prevent The Transmission Of  Spam, Viruses And/or Unlawful, Defamatory, Obscene Or Otherwise  Undesirable Material Or Content. We May Under Certain Circumstances  Procure An Element Of The Services From A Third Party Service Provider.  To The Extent That It May Be Necessary, And Solely For The Purposes Of  Providing The Service To You, You Agree That We May Disclose To Such  Third Party Any Of Your Personal Information That May Be Necessary For  The Procurement Of &nbsp;services From The Third Party.</div>\r\n<p>$privacypolicyprivacyPolicy</p>');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` varchar(50) NOT NULL,
  `product_price` float(10,2) NOT NULL,
  `product_status` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_category_id`, `product_name`, `product_description`, `product_image`, `product_price`, `product_status`) VALUES
(1, 1, 'My Teacher My Guide Cake', '<p>My Teacher My Guide Cake</p>', 'product_image1.jpg', 550.00, '1'),
(2, 1, 'Fruit Ecstasy Cake', '<p><span Style="color: Rgb(51, 51, 51); Font-family: &quot;Open Sans&quot;; Font-size: 14px;">A Beautiful Concoction Of Salivating Drip Cake, Rich Strawberry And Delightful Cream, And This Wonderful Creation Available In A Choice Of Flavours Is The Perfect Gift To Your Friends And Family.</span></p>', 'product_image2.jpg', 1200.00, '1'),
(3, 1, 'Zoo Animals Fondant', '<div Ng-repeat="key In NotSorted(product_section)" Ng-init="val = Product_section[key]" Class="ng-scope" Style="box-sizing: Border-box;">\r\n<div Class="ms-mt-l Ms-mb-l Hidden-ms Hidden-xs" Style="box-sizing: Border-box; Margin-top: 20px !important; Margin-bottom: 20px !important;">\r\n<div Ng-if="key==''description'' " Class="product-description Ng-scope" Style="box-sizing: Border-box;">\r\n<div Class="col-sm-12 Ms-mt-l" Style="box-sizing: Border-box; Margin-top: 20px !important; Position: Relative; Min-height: 1px; Padding-right: 15px; Padding-left: 15px; Width: 1148px;">\r\n<div Class="ms-ov-auto Ms-p-m Ng-scope" Data-ng-if="product.description" Style="box-sizing: Border-box; Overflow: Auto; Padding: 15px !important;">\r\n<div Class="description Ng-binding" Data-ng-bind-html-unsafe="product.description" Style="box-sizing: Border-box;">\r\n<p Style="box-sizing: Border-box; Margin: 0px 0px 8.5px;">Gift Your Little Ones Their Very Own Zoo And Light Up Their Special Day. Lions, Pink Elephants And Bears Created From Quality Fondant Galore The Landscape Of This Succulent Cream Cake Available In A Choice Of Chocolate Flavours. A Must For Every Party Celebrating The Little Ones Who Bring Immense Joy To Our Lives.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div Ng-repeat="key In NotSorted(product_section)" Ng-init="val = Product_section[key]" Class="ng-scope" Style="box-sizing: Border-box;">\r\n<div Class="panel-group" Role="tablist" Aria-multiselectable="true" Style="box-sizing: Border-box; Color: Rgb(51, 51, 51); Font-family: &quot;Open Sans&quot;; Font-size: 14px;">&nbsp;</div>\r\n<div Class="ms-mt-l Ms-mb-l Hidden-ms Hidden-xs" Style="box-sizing: Border-box; Color: Rgb(51, 51, 51); Font-family: &quot;Open Sans&quot;; Font-size: 14px; Margin-top: 20px !important; Margin-bottom: 20px !important;">\r\n<div Data-ng-if=" Key==''related_products'' " Class="box Col-sm-12 Ms-mt-l Related_products  Ng-scope" Style="box-sizing: Border-box; Margin-top: 20px !important; Position: Relative; Min-height: 1px; Padding-right: 15px; Padding-left: 15px; Width: 1148px;">\r\n<div Ng-if="related_products" Class="related_products Ng-scope" Style="box-sizing: Border-box;">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>', 'product_image3.jpg', 4800.00, '1');

-- --------------------------------------------------------

--
-- Table structure for table `returnsrefunds`
--

CREATE TABLE IF NOT EXISTS `returnsrefunds` (
  `returnsrefunds` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `returnsrefunds`
--

INSERT INTO `returnsrefunds` (`returnsrefunds`) VALUES
('<p>returnsrefunds1</p>\r\n<p>&nbsp;</p>\r\n<p><img Src="/userfiles/image/newcake.jpg" Width="550" Height="510" Alt="" /></p>');

-- --------------------------------------------------------

--
-- Table structure for table `shippingpolicy`
--

CREATE TABLE IF NOT EXISTS `shippingpolicy` (
  `shippingpolicy` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shippingpolicy`
--

INSERT INTO `shippingpolicy` (`shippingpolicy`) VALUES
('<p>shippingpolicy1</p>');

-- --------------------------------------------------------

--
-- Table structure for table `termsconditions`
--

CREATE TABLE IF NOT EXISTS `termsconditions` (
  `termsconditions` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `termsconditions`
--

INSERT INTO `termsconditions` (`termsconditions`) VALUES
('<h1><span Style="color: Rgb(0, 0, 255);">&nbsp;Terms &amp; Conditions</span></h1>\r\n<div Style="text-align: Justify;">We Welcome You To  Familybrands.in. The Website Familybrands.in Is Owned And Opreated By  M/s.Shyntec Controls. The Terms And Conditions Contained Herein Along  With The Privacy Policy Form An Agreement Regulating Our Relationship  With Regard To The Use Of Familybrands.in For Shopping By You, The User.  You Are Advised To Read This Agreement Carefully. If You Are Not  Agreeable To Any Terms And Conditions, You Should Not Use The Services.  You Can Use The Familybrands.in Services If You Are Agreeable To All The  Terms And Conditions Of This Agreement In Their Entirety. By Clicking  At The Space Provide For On The Familybrands.in Website, You Will Be  Deemed To Have Accepted This Agreement And It Will Be A Legally Binding  Agreement Between You And Familybrands.in).</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;"><strong>&nbsp;Applicable Law</strong></div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&nbsp;This Site Is Created And Controlled  By M/s.Shyntec Controls In Chennai, India; As Such The Laws OfIndia  Shall Apply; Courts In Chennai Shall Have Jurisdiction In Respect Of All  The Terms, Conditions And Disclaimers. Familybrands.in Reserves The  Right To Make Changes To The Site And The Terms, Conditions And  Disclaimers.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;"><strong>Definitions</strong></div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&quot;Agreement&quot; Means The Terms And  Conditions As Detailed Herein Including All Schedules, Appendices,  Annexure, Privacy Policy, Disclaimers, And Will Include The References  To This Agreement As Amended, Supplemented, Varied Or Replaced From Time  To Time.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&quot;Familybrands.in &quot;/ &quot;Site&quot; Means The  Online Shopping Platform, Which Provides A Venue To The Users Of  Familybrands.in To Buy The Products &amp; Services Listed On  Familybrands.in.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&quot;Customer&quot; / &quot;Buyer&quot; Shall Mean The  Person Or Any Legal Entity Who Accepts The Offer For Sale On  Familybrands.in By Placing An Order For And Or Purchases Any Products  Offered For Sale On Familybrands.in</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&quot;User&quot;/ &quot;You&quot; Means And Includes You  And/or Any Person Or An Entity Including Vendor Using Or Accessing The  Services Provided On This Site.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;"><strong>&nbsp;Eligibility</strong></div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&nbsp;You Represent And Warrant That You  Are Competent And Eligible To Enter Into Legally Binding Agreement And  Have The Requisite Authority To Bind Familybrands.in, To This Agreement.  You Shall Not Use This Site If You Are Not Competent To Contract Under  The Applicable Laws, Rules And Regulations.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;"><strong>Term Of Agreement/Service</strong></div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">This Agreement Shall Continue To Be In  Full Force And Effect For So Long As You Are Using The Familybrands.in  Services. Familybrands.in Provides The Online Shopping Platform Wherein  The Users Can Purchase/buy The Products And Services Listed On  Familybrands.in (the &quot;Services&quot;) Pursuant To The Terms And Conditions  Set Forth Below. By Clicking On The [Close] Button, You Agree To Use The  Services In A Manner Consistent With The Terms Hereof And Also Agree  Abide By The Terms And Conditions Of This Agreement, Including But Not  Limited To The Privacy Policy, And With All Applicable Laws And  Regulations. Either You Or Familybrands.in May Terminate The Service At  Any Time, With Or Without Cause. However, Familybrands.in Reserves The  Right, In Its Sole Discretion, To Terminate Your Access To The  Familybrands.in Services And The Related Services Or Any Portion Thereof  At Any Time, Without Notice</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;"><strong>&nbsp;Modification Of Terms And Conditions Of Service</strong></div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&nbsp;Familybrands.in May At Any Time  Modify The Terms And Conditions (&quot;Terms&quot;) Of The Services Without Any  Prior Notification To You. You Can Access The Latest Version Of The  Terms, Which Shall Be Updated Regularly At The Link In Our Website. You  Undertake To Regularly Review The Terms. In The Event That The Modified  Terms Are Not Acceptable To You, You Shall Immediately Discontinue Using  The Services. However, If You Continue To Use The Services, You Hereby  Agree To Accept And Be Bound By The Modified Terms.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;"><strong>Registration Data</strong></div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">To Avail Of And Use The Services, You  Shall Have To Register With Familybrands.in. As A Part Of Registration  Process, You Agree To Provide Familybrands.in Current, Complete, And  Accurate Registration Information (the &quot;Registration Data&quot;) As Prompted  To Do By The Service And To Maintain And Update This Information As  Required To Keep It Current, Complete And Accurate. If You Provide Any  Information That Is Untrue, Inaccurate Not Current Or Incomplete Or  Familybrands.in Has Reasonable Grounds To Suspect That Such Information  Is Untrue, Inaccurate, Not Current Or Incomplete, Familybrands.in Has  The Right To Indefinitely Suspend Or Terminate Your Membership And  Refuse To Provide You With Access To Familybrands.in. You Shall Be  Responsible For Maintaining The Confidentiality Of Your Password, Which  You Will Not Be Under An Obligation To Reveal To Any Representative Or  Agent Of Familybrands.in. You Agree And Understand That Familybrands.in  Services Are Supported By Advertisements And Therefore You Grant  Familybrands.in The Right To Disclose The Aggregate Registration Data To  Third Parties In Connection With Marketing The Services. Furthermore,  You Agree And Grant Familybrands.in The Right To Use Your Individual  Registration Data To Provide For Targeting Of Advertisements And Other  Service Offers To You. You Shall Notify To Our Customer Support  Department Of Any Known Or Suspected Unauthorized Use(s) Of Your  Account, Or Any Known Or Suspected Breach Of Security, Including Loss,  Theft, Or Unauthorized Disclosure Of Your Password.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;"><strong>&nbsp;Electronic Communication</strong></div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">You Consent To Receiving  Communications From Familybrands.in Electronically. Familybrands.in Will  Communicate With Users By Email Or By Posting Notices On The  Site.Online Shopping Platform :You Agree, Understand And Acknowledge  That Familybrands.in Is An Online Shopping Platform, A Venue Enabling  The Users To Buy Any Product/service Listed On Familybrands.in At The  Price Indicated In Connection With The Product In Question And/or Any  Other Terms And Conditions Indicated Therein At Any Time From Any Place.  You Further Agree And Acknowledge That Familybrands.in Is Only A  Facilitator, An Intermediary And Is Not And Cannot Be A Party To Or  Control In Any Manner Any Transactions Between The Vendor And The  Customer/Buyer. Familybrands.in Shall Neither Be Responsible Nor Liable  To Mediate Or Resolve Any Disputes Or Disagreements Between The Users  And/or Vendors. Familybrands.in Does Not Sell Or Retail Any Products And  Does Not Ensure That The Users Shall Perform Their Obligations In  Respect Of The Transaction Concluded On This Site And Further Expressly  Disclaims Any Warranties Or Representations Express Or Implied In  Respect Of Quality, Safety, Merchantability, Fitness For A Particular  Purpose, Or Legality Of The Products Listed And Transacted On  Familybrands.in . You Further Agree And Undertake That You Are Accessing  The Services Available On This Site And Transacting At Your Sole Risk  And Are Using Your Best And Prudent Judgment Before Entering Into Any  Transaction Through This Site. The Site Is A Channel Of Communication  Whereby The Users Can Reach A Larger Base To Buy Goods Or Services.  Familybrands.in Is Only Providing A Platform For Communication And It Is  Agreed That The Contract For Sale Of Any Of The Products Or Services  Shall Be A Strictly Bipartite Contract Between The Vendor And The Buyer.  At No Time Shall Any Right, Title Or Interest Over The Items Vest With  Familybrands.in Nor Shall Familybrands.in Have Any Obligations Or  Liabilities In Respect Of Such Contract. Familybrands.in Is Not  Responsible For Unsatisfactory Or Delayed Performance Of Services Or  Damages Or Delays As A Result Of Items, Which Are Out Of Stock, Back  Ordered, Returned Undelivered, Not Original Or Authorized, Or Otherwise  Unavailable. Familybrands.in Accepts No Liability For Any Errors Or  Omissions, Whether On Behalf Of Itself Or Third Parties. Familybrands.in  Is Not Responsible And Shall Not Be Responsible For Any Non-performance  Or Breach Of Any Contract Entered Into Between Users And Users. All  Orders Shall Be Pre-approved With An Acceptable Method Of Payment As  Available Through Payment Service Providers Connected With  Familybrands.in, Which May Call For And Require Additional Verification  Or Information. The Address At Which Delivery Of The Product Ordered By  You Is To Be Made Should Be Correct And Proper In All Respects. After  The Receipt Of Payment From The Buyer, Familybrands.in Shall Arrange For  The Delivery Of The Product To The Buyer At The Shipping Address  Provided By The Buyer. Any And All Orders Placed By You On This Site Are  A Firm Commitment To Purchase And You Are Obligated To Complete The  Transaction And Not Contest It In Anyway. Before Placing An Order You  Are Advised To Check The Product Description Carefully. By Placing An  Order For A Product You Agree To Be Bound By The Conditions Of Sale  Included In The Item''s Description.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;"><strong>Credit Card Details</strong></div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">You Agree, Understand And Confirm That  The Credit Card Details Provided By You For Availing Of Services On  Familybrands.in &nbsp;will Be Correct And Accurate And You Shall Not Use The  Credit Card Which Is Not Lawfully Owned By You. You Further Agree And  Undertake To Provide The Correct And Valid Credit Card Details To  Familybrands.in. Further The Said Information Will Be Not Be Utilized  And Shared By Familybrands.in &nbsp;with Any Of The Third Parties Unless  Required By Law, Regulation Or Court Order.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;"><strong>Confirmation</strong></div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">You Understand, Declare And Agree That:</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&bull; Familybrands.in Shall Not And Is Not Required To Mediate Or Resolve Any Dispute Or Disagreement Between You And The Vendor.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&bull; You Release And Indemnify  Familybrands.in And/or Any Of Its Officers And Representatives From Any  Cost, Damage, Liability Or Other Consequence Of Any Of Your Actions And  Specifically Waive Any Claims That You May Have In This Behalf Under Any  Applicable Law. Notwithstanding Its Reasonable Efforts In That Behalf,  Familybrands.in Cannot Control The Information Provided By Other Users  Which Is Made Available On The Site.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&bull; Familybrands.in Shall Be Responsible  To Deliver The Items To The Buyer Within The Time Period Specified For  Delivery By The Vendor.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&bull; Familybrands.in Shall Be Solely Responsible For Any Undelivered Or Damaged Items.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&bull; Familybrands.in Shall Be Solely  Responsible To Make Good The Loss Or Damage Or Any Claim Raised By The  Buyer In Respect Of Damaged Or Non-receipt Of Items.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&bull; Familybrands.in Shall Be Responsible  To Deliver The Products/items Of The Same Quantity And Same Qualities  As Are Listed On The Familybrands.in And That Such Product Shall  Correspond With The Description Of The Items Listed On Familybrands.in.  You Further Agree And Acknowledge That Familybrands.in Shall Not Be  Liable If The Description Of Goods Supplied By The Vendor Does Not  Match/correspond With The Description Provided At The Time Of Placing Of  Order By The Buyer.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&bull; Familybrands.in Shall Invoice / Bill Directly To The Buyer.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&bull; Complete Product Responsibility And  Liability Solely Vest With Vendor And Vendor Is Responsible To The Buyer  For The Sale Of The Product To Buyer Including But Not Limited To The  Delivery Of The Item/product To The Buyer. Neither Customer Nor Vendor  Shall Raise Any Claim On Familybrands.in In This Regard. Suspension Due  To Non-compliance With Agreement: Notwithstanding Other Legal Remedies  That May Be Available To Familybrands.in, Familybrands.in &nbsp;may In Its  Sole Discretion Limit User Activity By Immediately Removing User Listing  Either Temporarily Or Indefinitely Or Suspend Or Terminate User  Membership, And/or Refuse To Provide User With Access To The Site:</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&bull; If The User Is In Breach Any Of The Terms And Conditions Of This Agreement And/or The Terms Of Usage Of Familybrands.in;</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&bull; If The User Has Provided Wrong, Inaccurate, Incomplete Or Incorrect Information;</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">&bull; If Your Actions May Cause Any Harm,  Damage Or Loss To The Other Users Or Familybrands.in. Illegal And/or  Unauthorized Use Of The Service, Including Unauthorized Framing Of Or  Linking To The Familybrands.in Site And / Or Selling Or Offering For  Sale, Products Or Services That Infringe Third Party Rights Will Be  Investigated, And Appropriate Legal Action Will Be Taken, Including  Without Limitation, Civil, Criminal And Injunctive Redress.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;"><strong>Indemnity</strong></div>\r\n<div Style="text-align: Justify;">&nbsp;</div>\r\n<div Style="text-align: Justify;">User Agrees To Defend, Indemnify And  Hold Harmless Familybrands.in, Services, Its Employees, Directors,  Officers, Agents And Their Successors And Assigns From And Against Any  And All Claims, Liabilities, Damages, Losses, Costs And Expenses,  Including Attorney''s Fees, Caused By Or Arising Out Of Claims Based Upon  The User''s Actions Or Inactions, Including But Not Limited To Any  Warranties, Representations Or Undertakings Or In Relation To The  Non-fulfillment Of Any Of User&rsquo;s Obligations Under This Agreement Or  Arising Out Of The User''s Infringement Of Any Applicable Laws,  Regulations Including But Not Limited To Intellectual Property Rights,  Payment Of Statutory Dues And Taxes, Claim Of Libel, Defamation,  Violation Of Rights Of Privacy Or Publicity, Loss Of Service By Other  Subscribers And Infringement Of Intellectual Property Or Other Rights.  This Clause Shall Survive The Expiry Or Termination Of This Agreement.</div>\r\n<div Style="text-align: Justify;">&nbsp;</div>');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
