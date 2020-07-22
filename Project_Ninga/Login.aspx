<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project_Ninga.Login" %>

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
                        
                    </div>
                </div>
            </header>

             <section class="callaction">
                <div class="container">
		            <div class="row">
						<%--<div class="col-lg-8">
							<div class="cta-text">

                            </div>
                        </div>--%>
                        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                            <form role="form" class="register-form">
                                <h2>Sign in <small>manage your account</small></h2>
                                 <div class="form-group">
				                    <input type="text" name="Account_ID" id="Account_ID"  runat="server" class="form-control input-lg" placeholder="Account Number" tabindex="4">
			                    </div>
                                <div class="form-group">
				                    <input type="password" class="form-control input-lg" runat="server" id="exampleInputPassword1" placeholder="Password">
			                    </div>		                    
                                <div class="row">
				                    <div class="col-xs-12 col-md-6"><asp:Button type="submit" id="Signin" runat="server"  class="btn btn-primary btn-block btn-lg" tabindex="7" Text="Sign in" style="background:#401664" OnClick="Signin_Click"/></div>
				                    <!--<div class="col-xs-12 col-md-6">Don't have an account? <a href="register.aspx">Register</a></div>-->
			                    </div>
                            </form>
                        </div>
                    </div>
                </div>
              </section>
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="copyright">
				                <p>
					                <span>&copy; NatWest Groups - Public </span>
				                </p>
			                </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>

    </div>
    </form>
</body>
</html>
