<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page language="java" import="java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="shortcut icon" href="img/icon.png">
        
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/jquery.scrollbar.css" rel="stylesheet">
        <link href="css/templateGeneral.css" rel="stylesheet">
        <link href="css/image-picker.css" rel="stylesheet">
        <link href="css/dropit.css" rel="stylesheet">
                
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/dropit.js"></script>
        <script src="js/likeitshot.js"></script>
        <script src="js/jquery.scrollbar.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/3.2.0/imagesloaded.pkgd.js"></script>
        <script src="js/masonry.js"></script>
        <script src="js/image-picker.js"></script>
        <script src="js/register.js"></script>
        
    </head>
    <body>
            <div class="row" id="header">
            	<div class="col-md-1"></div>
                <a href="index.jsp"><div class="col-md-2 pokedex">
                	&nbsp;<p>
                    <img src="img/dex.png"><br/>Pok&eacute;dex
                </div></a>
                <a href="explore.jsp"><div class="col-md-1 explore">
                	&nbsp;
                	<p>
                	<img src="img/explore.png"><br/>Explore
                </div></a>
                <a href="./pokecenter"><div class="col-md-1 center">
                	&nbsp;<p>
                    <img src="img/medical.png"><br/>Pok&eacute;Center
                </div></a>
                <a href="./pokemart"><div class="col-md-1 mart">
					&nbsp;<p>
                    <img src="img/mart.png"><br/>Pok&eacute;Mart
                </div></a>
                <a href="gts.jsp"><div class="col-md-1 gts">
                	&nbsp;<p>
                    <img src="img/global.png"><br/>
                    GTS
                </div></a>
                <a href="./ratings"><div class="col-md-1 rate">
                    &nbsp;<p>
                    <img src="img/rate.png"><br/>
                    Ratings
                </div></a>
                <a href="battle.jsp"><div class="col-md-1 friends">
                    &nbsp;<p>
                    <img src="img/battle.png"><br>
                    Battle
                </div></a>
                <a href="./myteam"><div class="col-md-1 team">
                	&nbsp;<p>
                    <img src="img/team.png"><br/>My Team
                </div></a>
                <div class="col-md-1 profile">
                	&nbsp;<p>
                    <img src="img/profile.png"><br/>
                    <ul class="menu list-unstyled">
    <li style="margin-top:-8px; margin-bottom:8px;">
        <a href="./profile">Profile</a>
        <ul>
            <li class="drop"><a href="#">Messages</a></li>
            <li class="drop"><a href="./friends">Friend list</a></li>
            <li class="drop"><a href="#">Find user</a></li>
            <li class="drop"><a href="#">Settings</a></li>
            <li class="drop"><a href="#">Help</a></li>
        </ul>
    </li>
</ul>
                </div>
                <div class="col-md-1"></div>
            </div>
<!----- AQUÍ SE ACABA EL HEADER. REPITO. AQUÍ SE ACABA EL HEADER. EL CONTENIDO EMPIEZA AQUÍ. ----->

            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="row contenido">
                    	<div class="containmemore">
                            <h2 style="font-family:'Xolo'; padding-left:250px; padding-top:5px;">Register</h2>
							<div id="register" style="margin-top:-15px;">
                            	<br/>
                                <form action="./altaUsuario" method="post">
                                <table class="table-responsive">
                                    <tr>
                                    	<td>
                                        <table class="table-responsive" style="font-size:13px;">
                                	<tr>
                                    	<td class="padmemore">Name: </td>
                                        <td class="padmemore"><input name="name" type="text" class="noborder tfield"></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Username: </td>
                                        <td class="padmemore"><input name="user" type="text" class="noborder tfield"></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Birthday: </td>
                                        <td class="padmemore"><input name="bday" type="date" class="noborder tfield"></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Country: </td>
                                        <td class="padmemore">
                                        <select name="country" class="noborder tfield">
                                        <option value="" disabled selected hidden>Select your country</option>
                                        <option value="AF">Afghanistan</option>
                                        <option value="AL">Albania</option>
                                        <option value="DZ">Algeria</option>
                                        <option value="AS">American Samoa</option>
                                        <option value="AD">Andorra</option>
                                        <option value="AG">Angola</option>
                                        <option value="AI">Anguilla</option>
                                        <option value="AG">Antigua &amp; Barbuda</option>
                                        <option value="AR">Argentina</option>
                                        <option value="AA">Armenia</option>
                                        <option value="AW">Aruba</option>
                                        <option value="AU">Australia</option>
                                        <option value="AT">Austria</option>
                                        <option value="AZ">Azerbaijan</option>
                                        <option value="BS">Bahamas</option>
                                        <option value="BH">Bahrain</option>
                                        <option value="BD">Bangladesh</option>
                                        <option value="BB">Barbados</option>
                                        <option value="BY">Belarus</option>
                                        <option value="BE">Belgium</option>
                                        <option value="BZ">Belize</option>
                                        <option value="BJ">Benin</option>
                                        <option value="BM">Bermuda</option>
                                        <option value="BT">Bhutan</option>
                                        <option value="BO">Bolivia</option>
                                        <option value="BL">Bonaire</option>
                                        <option value="BA">Bosnia Herzegovina</option>
                                        <option value="BW">Botswana</option>
                                        <option value="BR">Brazil</option>
                                        <option value="BC">British Indian Ocean</option>
                                        <option value="BN">Brunei</option>
                                        <option value="BG">Bulgaria</option>
                                        <option value="BF">Burkina Faso</option>
                                        <option value="BI">Burundi</option>
                                        <option value="KH">Cambodia</option>
                                        <option value="CM">Cameroon</option>
                                        <option value="CA">Canada</option>
                                        <option value="IC">Canary Islands</option>
                                        <option value="CV">Cape Verde</option>
                                        <option value="KY">Cayman Islands</option>
                                        <option value="CF">Central African</option>
                                        <option value="TD">Chad</option>
                                        <option value="CD">Channel Islands</option>
                                        <option value="CL">Chile</option>
                                        <option value="CN">China</option>
                                        <option value="CI">Christmas Island</option>
                                        <option value="CS">Cocos Island</option>
                                        <option value="CO">Colombia</option>
                                        <option value="CC">Comoros</option>
                                        <option value="CG">Congo</option>
                                        <option value="CK">Cook Islands</option>
                                        <option value="CR">Costa Rica</option>
                                        <option value="CT">Cote D'Ivoire</option>
                                        <option value="HR">Croatia</option>
                                        <option value="CU">Cuba</option>
                                        <option value="CB">Curacao</option>
                                        <option value="CY">Cyprus</option>
                                        <option value="CZ">Czech Republic</option>
                                        <option value="DK">Denmark</option>
                                        <option value="DJ">Djibouti</option>
                                        <option value="DM">Dominica</option>
                                        <option value="DO">Dominican Republic</option>
                                        <option value="TM">East Timor</option>
                                        <option value="EC">Ecuador</option>
                                        <option value="EG">Egypt</option>
                                        <option value="SV">El Salvador</option>
                                        <option value="GQ">Equatorial Guinea</option>
                                        <option value="ER">Eritrea</option>
                                        <option value="EE">Estonia</option>
                                        <option value="ET">Ethiopia</option>
                                        <option value="FA">Falkland Islands</option>
                                        <option value="FO">Faroe Islands</option>
                                        <option value="FJ">Fiji</option>
                                        <option value="FI">Finland</option>
                                        <option value="FR">France</option>
                                        <option value="GF">French Guiana</option>
                                        <option value="PF">French Polynesia</option>
                                        <option value="FS">French Southern Ter</option>
                                        <option value="GA">Gabon</option>
                                        <option value="GM">Gambia</option>
                                        <option value="GE">Georgia</option>
                                        <option value="DE">Germany</option>
                                        <option value="GH">Ghana</option>
                                        <option value="GI">Gibraltar</option>
                                        <option value="GB">Great Britain</option>
                                        <option value="GR">Greece</option>
                                        <option value="GL">Greenland</option>
                                        <option value="GD">Grenada</option>
                                        <option value="GP">Guadeloupe</option>
                                        <option value="GU">Guam</option>
                                        <option value="GT">Guatemala</option>
                                        <option value="GN">Guinea</option>
                                        <option value="GY">Guyana</option>
                                        <option value="HT">Haiti</option>
                                        <option value="HW">Hawaii</option>
                                        <option value="HN">Honduras</option>
                                        <option value="HK">Hong Kong</option>
                                        <option value="HU">Hungary</option>
                                        <option value="IS">Iceland</option>
                                        <option value="IN">India</option>
                                        <option value="ID">Indonesia</option>
                                        <option value="IA">Iran</option>
                                        <option value="IQ">Iraq</option>
                                        <option value="IR">Ireland</option>
                                        <option value="IM">Isle of Man</option>
                                        <option value="IL">Israel</option>
                                        <option value="IT">Italy</option>
                                        <option value="JM">Jamaica</option>
                                        <option value="JP">Japan</option>
                                        <option value="JO">Jordan</option>
                                        <option value="KZ">Kazakhstan</option>
                                        <option value="KE">Kenya</option>
                                        <option value="KI">Kiribati</option>
                                        <option value="NK">Korea North</option>
                                        <option value="KS">Korea South</option>
                                        <option value="KW">Kuwait</option>
                                        <option value="KG">Kyrgyzstan</option>
                                        <option value="LA">Laos</option>
                                        <option value="LV">Latvia</option>
                                        <option value="LB">Lebanon</option>
                                        <option value="LS">Lesotho</option>
                                        <option value="LR">Liberia</option>
                                        <option value="LY">Libya</option>
                                        <option value="LI">Liechtenstein</option>
                                        <option value="LT">Lithuania</option>
                                        <option value="LU">Luxembourg</option>
                                        <option value="MO">Macau</option>
                                        <option value="MK">Macedonia</option>
                                        <option value="MG">Madagascar</option>
                                        <option value="MY">Malaysia</option>
                                        <option value="MW">Malawi</option>
                                        <option value="MV">Maldives</option>
                                        <option value="ML">Mali</option>
                                        <option value="MT">Malta</option>
                                        <option value="MH">Marshall Islands</option>
                                        <option value="MQ">Martinique</option>
                                        <option value="MR">Mauritania</option>
                                        <option value="MU">Mauritius</option>
                                        <option value="ME">Mayotte</option>
                                        <option value="MX">Mexico</option>
                                        <option value="MI">Midway Islands</option>
                                        <option value="MD">Moldova</option>
                                        <option value="MC">Monaco</option>
                                        <option value="MN">Mongolia</option>
                                        <option value="MS">Montserrat</option>
                                        <option value="MA">Morocco</option>
                                        <option value="MZ">Mozambique</option>
                                        <option value="MM">Myanmar</option>
                                        <option value="NA">Nambia</option>
                                        <option value="NU">Nauru</option>
                                        <option value="NP">Nepal</option>
                                        <option value="AN">Netherland Antilles</option>
                                        <option value="NL">Netherlands</option>
                                        <option value="NV">Nevis</option>
                                        <option value="NC">New Caledonia</option>
                                        <option value="NZ">New Zealand</option>
                                        <option value="NI">Nicaragua</option>
                                        <option value="NE">Niger</option>
                                        <option value="NG">Nigeria</option>
                                        <option value="NW">Niue</option>
                                        <option value="NF">Norfolk Island</option>
                                        <option value="NO">Norway</option>
                                        <option value="OM">Oman</option>
                                        <option value="PK">Pakistan</option>
                                        <option value="PW">Palau Island</option>
                                        <option value="PS">Palestine</option>
                                        <option value="PA">Panama</option>
                                        <option value="PG">Papua New Guinea</option>
                                        <option value="PY">Paraguay</option>
                                        <option value="PE">Peru</option>
                                        <option value="PH">Philippines</option>
                                        <option value="PO">Pitcairn Island</option>
                                        <option value="PL">Poland</option>
                                        <option value="PT">Portugal</option>
                                        <option value="PR">Puerto Rico</option>
                                        <option value="QA">Qatar</option>
                                        <option value="ME">Rep. of Montenegro</option>
                                        <option value="RS">Rep. of Serbia</option>
                                        <option value="RE">Reunion</option>
                                        <option value="RO">Romania</option>
                                        <option value="RU">Russia</option>
                                        <option value="RW">Rwanda</option>
                                        <option value="NT">St Barthelemy</option>
                                        <option value="EU">St Eustatius</option>
                                        <option value="HE">St Helena</option>
                                        <option value="KN">St Kitts-Nevis</option>
                                        <option value="LC">St Lucia</option>
                                        <option value="MB">St Maarten</option>
                                        <option value="PM">St Pierre &amp; Miquelon</option>
                                        <option value="VC">St Vincent &amp; G.</option>
                                        <option value="SP">Saipan</option>
                                        <option value="SO">Samoa</option>
                                        <option value="AS">Samoa American</option>
                                        <option value="SM">San Marino</option>
                                        <option value="ST">Sao Tome &amp; Principe</option>
                                        <option value="SA">Saudi Arabia</option>
                                        <option value="SN">Senegal</option>
                                        <option value="RS">Serbia</option>
                                        <option value="SC">Seychelles</option>
                                        <option value="SL">Sierra Leone</option>
                                        <option value="SG">Singapore</option>
                                        <option value="SK">Slovakia</option>
                                        <option value="SI">Slovenia</option>
                                        <option value="SB">Solomon Islands</option>
                                        <option value="OI">Somalia</option>
                                        <option value="ZA">South Africa</option>
                                        <option value="ES">Spain</option>
                                        <option value="LK">Sri Lanka</option>
                                        <option value="SD">Sudan</option>
                                        <option value="SR">Suriname</option>
                                        <option value="SZ">Swaziland</option>
                                        <option value="SE">Sweden</option>
                                        <option value="CH">Switzerland</option>
                                        <option value="SY">Syria</option>
                                        <option value="TA">Tahiti</option>
                                        <option value="TW">Taiwan</option>
                                        <option value="TJ">Tajikistan</option>
                                        <option value="TZ">Tanzania</option>
                                        <option value="TH">Thailand</option>
                                        <option value="TG">Togo</option>
                                        <option value="TK">Tokelau</option>
                                        <option value="TO">Tonga</option>
                                        <option value="TT">Trinidad &amp; Tobago</option>
                                        <option value="TN">Tunisia</option>
                                        <option value="TR">Turkey</option>
                                        <option value="TU">Turkmenistan</option>
                                        <option value="TC">Turks &amp; Caicos Is</option>
                                        <option value="TV">Tuvalu</option>
                                        <option value="UG">Uganda</option>
                                        <option value="UA">Ukraine</option>
                                        <option value="AE">United Arab Emirates</option>
                                        <option value="GB">United Kingdom</option>
                                        <option value="US">United States</option>
                                        <option value="UY">Uruguay</option>
                                        <option value="UZ">Uzbekistan</option>
                                        <option value="VU">Vanuatu</option>
                                        <option value="VS">Vatican City State</option>
                                        <option value="VE">Venezuela</option>
                                        <option value="VN">Vietnam</option>
                                        <option value="VB">Virgin Islands (Brit)</option>
                                        <option value="VA">Virgin Islands (USA)</option>
                                        <option value="WK">Wake Island</option>
                                        <option value="WF">Wallis &amp; Futana Is</option>
                                        <option value="YE">Yemen</option>
                                        <option value="ZR">Zaire</option>
                                        <option value="ZM">Zambia</option>
                                        <option value="ZW">Zimbabwe</option>
                                        </select>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Password: </td>
                                        <td class="padmemore"><input name="pass" type="password" class="noborder tfield"></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">Password repeat: </td>
                                        <td class="padmemore"><input name="passConfirm" type="password" class="noborder tfield"></td>
                                    </tr>
                                    <tr>
                                    	<td class="padmemore">e-mail:</td>
                                        <td class="padmemore"><input name="mail" type="text" class="noborder tfield"></td>
                                    </tr>
                                </table>
                                        </td>
                                                                                                        
                                    	<td>
                                        	<table class="table-responsive">
                                            	<tr>
                                                	<td>
                                                    <h4>Trainer sprite:</h4><p>
                                                    <select name="sprite" class="image-picker">
                                                    
                                                    <option
                                                    	data-img-src='img/train/m1.png' value='img/train/m1.png'>
                                                     </option>
                                                     <option
                                                    	data-img-src='img/train/f1.png' value='img/train/f1.png'>
                                                     </option>
                                                     <option
                                                    	data-img-src='img/train/m2.png' value='img/train/m2.png'>
                                                     </option>
                                                     <option
                                                    	data-img-src='img/train/f2.png' value='img/train/f2.png'>
                                                     </option>
                                                     <option
                                                    	data-img-src='img/train/m3.png' value='img/train/m3.png'>
                                                     </option>
                                                     <option
                                                    	data-img-src='img/train/f3.png' value='img/train/f3.png'>
                                                     </option>
                                                     <option
                                                    	data-img-src='img/train/m4.png' value='img/train/m4.png'>
                                                     </option>
                                                     <option
                                                    	data-img-src='img/train/f4.png' value='img/train/f4.png'>
                                                     </option>
                                                     <option
                                                    	data-img-src='img/train/m5.png' value='img/train/m5.png'>
                                                     </option>
                                                     <option
                                                    	data-img-src='img/train/f5.png' value='img/train/f5.png'>
                                                     </option>
                                                     <option
                                                    	data-img-src='img/train/m6.png' value='img/train/m6.png'>
                                                     </option>
                                                     <option
                                                    	data-img-src='img/train/f6.png' value='img/train/f6.png'>
                                                     </option>
                                                    </select>                                                    
                                                    </td>
                                                </tr>
                                                <tr>
                                            </table>                                    
                                        </td>
                                        </tr>
                                </table>
                                	<div id="idPokemon">
                                    <h4>Starter Pok&eacute;mon:</h4><p><br/>
                                 	<select name="starter" class="image-picker grid">
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/001.gif' value='1'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/004.gif' value='4'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/007.gif' value='7'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/152.gif' value='152'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/155.gif' value='155'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/158.gif' value='158'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/252.gif' value='252'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/255.gif' value='255'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/258.gif' value='258'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/387.gif' value='387'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/390.gif' value='390'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/393.gif' value='393'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/495.gif' value='495'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/498.gif' value='498'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/501.gif' value='501'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/650.gif' value='650'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/653.gif' value='653'>
                                    </option>
                                    <option class="grid-item"
                                    	data-img-src='img/sprite/656.gif' value='656'>
                                    </option>
                                    </select>
                                    </div>
                                <table>
                                	<tr>
                                    <td style="padding-left:20px;" colspan="2">
                                    Nickname:&nbsp;&nbsp;
                                    <input name="nick" type="text" maxlength="20" size="15" class="noborder tfield">
                                    </td>
                                    </tr>
                                	<tr>
                                    <td style="padding-left:20px;" width="80%">
                                    <font color="#FF3333" size="-1">
                                    <c:out value="${error}" />
                                    </font>
                                    </td>
                                	<td style="text-align:right;">
                                    <input name="create" type="submit" value="Register" class="btn2" style="margin-right:20px;">
                                	</td>
                                    </tr>
                                </table>
                                </form>
                                <p>
                            </div>                            
                    	</div><!-- Contain me --->
                    </div><!--Row Contenido --->
                </div><!-- Col Md 10 --->
                <div class="col-md-1"></div>
            </div><!-- Row --->

<!----- AQUÍ SE ACABA EL CONTENIDO Y EMPIEZA EL FOOTER. CONTENIDO ACABA AQUÍ. FOOTER EMPIEZA AQUÍ. --------->

				<div class="row">
                	<div class="col-md-1"></div>
                    <div class="col-md-10">
                    &nbsp;<br>
                	<p align="right"><font face="Segoe UI">
                	Contact us | About us | Privacy Policy | Site Map
                	</font>
                    </div>
                	<div class="col-md-1"></div>
				</div>
    </body>
</html>
