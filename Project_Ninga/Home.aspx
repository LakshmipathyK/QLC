<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Project_Ninga.Home" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    
    <!--<link href="css/cubeportfolio.min.css" rel="stylesheet" /> -->
    <title>NatWest Change Ninjas'</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="wrapper">
            <header>
                <div class="navbar navbar-default navbar-static-top" style="background-color:#401664">
                    <div class="container" >
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <!--<a class="navbar-brand" href="index.html"><p style="color:white"> NatWest Project Ninja</p></a> -->
                            <h1 style="color:white"> Change Ninjas&#39;</h1>
                        </div>
                        <div class="navbar-collapse collapse ">
                            <ul class="nav navbar-nav">
                                <li><a href="Home.aspx" id="prohome" runat="server" style="color:white">Home</a></li>                             
                                 <li><a href="Profile.aspx" id="prolink" runat="server" style="color:white">Profile</a></li>
                               
                            </ul>
                        </div>
                    </div>
                </div>
            </header>
            <section class="callaction">
                <div class="container">
		            <div class="row">
						<div class="col-lg-10">
                            <div class="cta-text">
                                <h2>Welcome to Change Ninjas&#39; Trade the World<span> - </span>Growth for all !</h2>
                                <h4>Source! Capture! Optmization!</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="callaction">
                <div class="container">
		            <div class="row">
						<div class="col-lg-8">
							<div class="cta-text">
								<!--<div class="dropdown">
                                  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Dropdown button
                                  </button>
                                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                  </div>
                                </div>-->
                                <div style="align-content:center">
                                <table style="width:80%;vertical-align:central">
                                    <tr>
                                        <td>
                                            <label for="Business_Type">Choose your business type:</label>
                                            <div class="custom-select" style="width:200px;">
                                            <select  id="BCategory" runat="server" name="BCategory">
                                                <option value="All">-- All --</option>
                                                <option value="AUTO">Automobiles</option>
                                                <option value="FB">Foods and Beverages</option>
                                                <option value="FA">Fasion & Apparels</option>
                                                <option value="BOOKS">Books</option>
                                                <option value="ELE">Electronics</option>
                                                <option value="SF">Sports & Fitness</option>
                                            </select>
                                            </div>
                                        </td>
                                        <td>
                                             <label for="Cust2">Supplier/Middle Man/ Buyer</label>
                                            <div class="custom-select" style="width:200px;">
                                            <select runat="server" id="BTYPE" name="Btype">
                                                <option value="All">-- All --</option>
                                                <option value="Buyer">Buyer</option>
                                                <option value="MiddleMan">Middle Man</option>
                                                <option value="Supplier">Supplier</option>
                                            </select>
                                            </div>
                                        </td>
                                        <td>
                                            <!--<input type="submit" value="Submit"/>-->
                                                                                    <br />
                                           <!-- <button class="btn btn-box" id="CSearch" runat="server" style="background-color:#401664;color:white" >Search</button>  -->
                                            <asp:Button class="btn btn-box" ID="btncsearch" runat="server" Text="Search" style="background-color:#401664;color:white" OnClick="btncsearch_Click" />
                                            
                                        </td>
                                    </tr>
                                </table>
                                </div>

                               
                                    
							</div>
						</div>
                        <div>
                           
                        </div>
						<div class="col-lg-4">
							<div class="cta-btn">
								<!--<a href="#" class="btn btn-theme btn-lg">Grab it now <i class="fa fa-angle-right"></i></a> -->
                                
							</div>

						</div>	
		                
		            </div>
                    <asp:GridView ID="GridHomeResult" runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                            OnPageIndexChanging="OnPageIndexChanging" PageSize="10" OnDataBinding="GridHomeResult_DataBinding" OnSelectedIndexChanged="GridHomeResult_SelectedIndexChanged" OnRowCreated="GridHomeResult_RowCreated">
                            <Columns>
                                <asp:BoundField ItemStyle-Width="150px" DataField="Sorority_ID" HeaderText="Sorority ID" >
<ItemStyle Width="150px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField ItemStyle-Width="150px" DataField="CustomerName" HeaderText="Customer Name" >
<ItemStyle Width="150px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField ItemStyle-Width="150px" DataField="BusinessCategory" HeaderText="Business Category" >
<ItemStyle Width="150px"></ItemStyle>
                                </asp:BoundField>
                                 <asp:BoundField ItemStyle-Width="150px" DataField="BusinessType" HeaderText="Business Type" >
<ItemStyle Width="150px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField ItemStyle-Width="150px" DataField="ContactNumber" HeaderText="Contact Number" >
<ItemStyle Width="150px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField ItemStyle-Width="150px" DataField="EmailContact" HeaderText="Email Contact" >
<ItemStyle Width="150px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField ItemStyle-Width="150px" DataField="Address" HeaderText="Address & City" >
<ItemStyle Width="150px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField ItemStyle-Width="150px" DataField="Country" HeaderText="Country" >
<ItemStyle Width="150px"></ItemStyle>
                                </asp:BoundField>
                                
                            </Columns>
                            <RowStyle Height="60px" />
                            <SelectedRowStyle BackColor="Gray" />
                        </asp:GridView>
	            </div>
            </section>
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="copyright">
				                <p>
					                <span>&copy; NatWest Groups - Public </span>
                                    <div style="align-content:flex-end">
                                        <asp:Label ID="lblmyid" runat="server" Text="" Visible="False" ></asp:Label>
                                    </div>
                                    
				                </p>
			                </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    </form>
    <script src="js/dropdown.js"></script>
</body>
</html>
