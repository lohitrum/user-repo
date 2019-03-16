<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AppNueva.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Illary Joste S.R.L</title>

    <link rel="stylesheet" type="text/css" href="resource/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="resource/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="resource/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="resource/css/style.css" />

    <style>
        .loader {
            border: 3px solid #f3f3f3; /* Light grey */
            border-top: 3px solid #3498db; /* Blue */
            border-radius: 50%;
            width: 20px;
            height: 20px;
            animation: spin 2s linear infinite;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        .hide{
            display:none;  
        }

    </style>

</head>
<body>

    <!--header-->
    <header class="main-header" id="header">
        <div class="bg-color">
            <!--nav-->
            <nav class="nav navbar-default navbar-fixed-top">
                <div class="container">
                    <div class="col-md-12">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mynavbar" aria-expanded="false" aria-controls="navbar">
                                <span class="fa fa-bars"></span>
                            </button>
                            <a class="navbar-brand" href="#">
                                <img src="resource/img/illary.png" /></a>&nbsp;
                        </div>
                        <div class="collapse navbar-collapse navbar-right" id="mynavbar">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#header">Inicio</a></li>
                                <li><a href="#empresa">Quienes Somos</a></li>
                                <li><a href="#productos">Productos</a></li>
                                <li><a href="#contact">Contactenos</a></li>
                                <li id="liinventario" class="hide"><a href="#" onclick="popupwindow('Paginas/Hilados.aspx','Almacen Hilados','1000','700');">Hilados</a></li>
                                <li class="dropdown" id="SectionLogin" style="display: normal;">
                                    <a id="Loginlink" class="dropdown-toggle" data-toggle="dropdown" href="#"><i title="Iniciar Sesion" class="fa fa-user fa-1x"></i> INICIAR SESION</a>
                                    <div class="dropdown-menu dropdown-user">
                                        <div class="col-lg-12 ">
                                            <a class="colorwhite">Iniciar Sesion</a>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="usuario" placeholder="Nombre de Usuario" />
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control" id="clave" placeholder="Contraseña" />
                                            </div>
                                            <div class="divider"></div>
                                            <div class="text-center">
                                                <a class="btn btn-send" id="btnEntrar">Acceder</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li id="SectionLoader" style="display: none;">
                                    <div class="loader"></div>
                                </li>
                                <li id="SectionLogout" style="display: normal;">
                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" id="lblusername" aria-expanded="false"></a>
                                            <ul class="dropdown-menu col-xs-12">
                                                <li><a href="#" style="text-align: right;" id="lblLogout"><i class="fa fa-sign-out fa-1x" aria-hidden="true"></i> Cerrar Session</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
            <!--/ nav-->

            <div class="col-md-12 col-sm-12 container text-center">
                <div class="wrapper wow fadeInUp delay-05s">
                    <h3 class="title">Illary</h3>
                    <h4 class="sub-title">Accesorios de Tejido Plano</h4>
                    <a href="#productos" class="btn btn-submit">Ver Productos</a>

                </div>
            </div>

        </div>
    </header>

    <div class="section-padding wow fadeInUp delay-02s" id="empresa">
        <div class="container">
            <div class="container">
                <div class="row top-pad">
                    <div class="col-md-4 col-sm-12">
                        <div class="section-title">
                            <h2 class="head-title black">Illary Joste SRL</h2>
                            <hr class="botm-line" />

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3 col-sm-12 text-center">

                        <img src="resource/img/banner3.jpg" />
                    </div>

                    <div class="col-md-3 col-sm-12 ">
                        <h4 class="black">Entidad</h4>
                        <p>Empresa de Fabricacion y/o Comercializacion</p>
                        <h4 class="black">Año de Fundacion</h4>
                        <p>2005</p>
                        <h4 class="black">Ubicacion</h4>
                        <p>Arequipa - Peru</p>
                        <h4 class="black">Sector</h4>
                        <p>Textil</p>

                        <h4 class="black">Experiencia</h4>
                        <ul>
                            <li type="square">20 años de conocimiento del proceso textil</li>
                            <li type="square">12 años como productos propios y comercializadores de productos de alpaca</li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-12 text-justify">
                        <h4 class="black">Especialidad en Oficio</h4>
                        <ul>
                            <li type="square">Tejido Plano Industrial</li>
                            <li type="square">Elaboracion de diseños y productos personalizados a solicitud de cliente</li>

                        </ul>
                        <img src="resource/img/diseños.jpg" />
                        <h4 class="black">Especialidad del Producto</h4>
                        <ul>
                            <li type="square">Bufandas / Chalinas</li>
                            <li type="square">Chales Estolas</li>
                            <li type="square">Pashminas</li>
                            <li type="square">Ruanas Capas</li>
                            <li type="square">Mantas Mantones</li>
                        </ul>


                        <h4 class="black">Especialidad en Materias Primas</h4>
                        <ul>
                            <li type="square">100% Baby Alpaca</li>
                            <li type="square">70% Baby 30% Seda</li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-12 text-center">
                        <h4 class="black">Hilanderia</h4>
                        <p>Trabajamos de la mano con proveedores con mas de 50 años de experiencia</p>
                        <br />
                        <a href="http://www.incatops.com/" target="_blank">
                            <img src="resource/img/incatops.jpg" /></a>
                        <br />
                        <a href="http://www.michell.com.pe/" target="_blank">
                            <img src="resource/img/michell.jpg" /></a>

                    </div>
                </div>



            </div>
        </div>
    </div>

    <div class="section-padding wow fadeInUp delay-02s" id="productos">
        <div class="container">
            <div id="idPage" class="container">
                <div class="row top-pad">
                    <div class="col-md-4 col-sm-12">
                        <div class="section-title">
                            <h2 class="head-title black">Lista de Productos</h2>
                            <hr class="botm-line" />

                        </div>
                    </div>
                    <div class="col-md-8 col-sm-12">
                        <br />
                        <ul id="link" class="breadcrumb  text-left">
                        </ul>

                    </div>

                </div>

                <div class="row ">

                    <div id="contenido" class=" col-md-12">
                    </div>

                </div>
                <!-- /.row -->


            </div>
        </div>
    </div>
    <!-- /.container -->

    <div class="section-padding wow fadeInUp delay-05s" id="contact">
        <div class="container">
            <div class="row white">
                <div class="col-md-8 col-sm-12">
                    <div class="section-title">
                        <h2 class="head-title black">Contactenos</h2>
                        <hr class="botm-line" />
                    </div>
                </div>
                <div class="col-md-12 col-sm-12">
                    <div class="col-md-4 col-sm-6">
                        <h3 class="cont-title">Envianos tu Mensaje</h3>

                        <div class="contact-info">
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" id="name" placeholder="Apellidos y Nombres" data-msg="Please enter at least 4 chars" />
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" name="email" id="email" placeholder="Correo Electronico" data-rule="email" data-msg="Please enter a valid email" />
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="message" rows="5" id="descrip" placeholder="Escribe tu mensaje"></textarea>

                            </div>
                            <div class="form-group">
                                <button type="button" id="btnEnviar" class="btn btn-send">Enviar Mensaje</button>&nbsp&nbsp&nbsp&nbsp
                                    <span class="text-right" id="load"></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-6 text-justify">
                        <br />
                        <h5>Si desea mas información acerca de nuestros productos, politicas de comercio o precios, puede escribirnos a nuestro correo electronico:</h5>
                        <h3 class="black"><span aria-hidden="true" class="fa fa-envelope"></span>ventas@illary.com</h3>
                        <h5>Si desea ver los productos por usted mismo o quiza conversar de asuntos que requieran una atencion mas personal, puede llamarnos a los siguientes telefonos para coordinar una reunion de negocios con un representante.</h5>
                        <h4 class="black">Asistente de Ventas</h4>
                        <h5><span aria-hidden="true" class="fa fa-phone"></span>Telefono: (Claro) +51-959784044</h5>
                        <h4 class="black">Visitenos</h4>
                        <h5><span aria-hidden="true" class="fa fa-map-marker"></span>Dirección: </h5>
                        <h5>Calle Sanchez Trujillo #403-B</h5>
                        <h5>Urb. Cerro Salaverry - Socabaya</h5>
                        <h5>Arequipa - Peru</h5>
                    </div>
                    <div class="col-md-3 text-center">
                        <img src="resource/img/banner4.jpg" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!---->

    <!---->
    <footer class="" id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-5 footer-social">
                    <div class="pull-right hidden-xs hidden-sm">

                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-dribbble"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-google-plus"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!---->
    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <span class="close btn btn-send">&times;</span>
            <h4 id="titulo"></h4>
            <br />
            <div class="contenidoimagen"></div>
        </div>

    </div>
    <script src="resource/js/jquery.min.js"></script>
    <script src="resource/js/jquery.easing.min.js"></script>
    <script src="resource/js/bootstrap.min.js"></script>
    <script src="resource/js/wow.js"></script>
    <script src="resource/js/custom.js"></script>
    <!--JavaScript file  -->
    <script src="resource/js/jquery-1.7.1.min.js"></script>
    <!--JavaScript file  -->
    <script src="resource/scripts/productos.js"></script>
    <script src="resource/js/vanilla.idle.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            VerificaToken();
            var Expiratoken = RestartTimeout();
            localStorage.setItem("timeout", Expiratoken);
            
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequest);
            function EndRequest(sender, args) {
                if (args.get_error() == undefined) {
                    $('.dropdown-toggle').dropdown();
                }
            }
        });

        $("#btnEntrar").click(function () {
            if ($("#usuario").val() != "" && $("#usuario").val() != "undefined" && $("#clave").val() != "" && $("#usuario").val() != "undefined") {
                $("#SectionLoader").show("slow");
                params = {
                    "usuario": $("#usuario").val(),
                    "clave": $("#clave").val()
                }

                $.ajax({
                    type: "POST",
                    url: "/Default.aspx/Login",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(params),
                    success: function (data) {
                        if (data.d != null && data.d != "" && data.d != "null") {

                            var listaAcceso = JSON.parse(data.d)

                            localStorage.setItem("token", listaAcceso.token);
                            localStorage.setItem("ac_hilados", listaAcceso.ac_hilados);

                            var Expiratoken = RestartTimeout();
                            localStorage.setItem("timeout", Expiratoken);
                            localStorage.setItem("user", $("#usuario").val());
                            $("#usuario").val("");
                            $("#clave").val("");
                            tempProd.init();
                        }
                        else {
                            alert("Por favor, ingrese un usuario y clave validos.");
                            $("#usuario").val("");
                            $("#clave").val("");
                        }
                    },
                    complete: function () {
                        VerificaToken();
                        $("#SectionLoader").hide("slow");
                    }
                });
            }
            else {
                $("#usuario").focus();
                return false;
            }
        });

        $("#lblLogout").click(function () {
            CierraSession();
        });

        function VerificaToken() {
            VerificaTimeout();
            if (localStorage.getItem("token") != null && localStorage.getItem("token") != "") {
                IniciaSession();
            }
            else {
                CierraSession();
            }
        }

        function VerificaTimeout() {
            if (localStorage.getItem("timeout") != null && localStorage.getItem("timeout") != "") {
                if (new Date().toLocaleString() > localStorage.getItem("timeout")) {
                    if (localStorage.getItem("token") != null && localStorage.getItem("token") != "") {
                        //alert("Lo Sentimos! Supero el tiempo maximo de inactividad. Por favor vuelva a iniciar session");
                        CierraSession();
                    }
                }
            }
            else {
                CierraSession();
            }
        }

        function CierraSession() {
            if (localStorage.getItem("token") != null && localStorage.getItem("token") != "") {
                localStorage.clear();
                location.reload();
            }
        }

        function IniciaSession() {
            $("#lblusername").text(localStorage.getItem("user"));
            $("#lblusername").append("<span class='caret'></span>");
            $("#SectionLogin").hide("slow");
            $("#SectionLogout").show("slow");

            if (localStorage.getItem("ac_hilados")) {
                $('#liinventario').removeClass('hide');
            }
        }

        function RestartTimeout() {
            var currentdate = new Date();
            currentdate.setMinutes(currentdate.getMinutes() + 20);
            var Expiratoken = currentdate.toLocaleString();
            return Expiratoken;
        }

        function popupwindow(url, title, w, h) {
            var left = (screen.width/2)-(w/2);
            var top = (screen.height/2)-(h/2);
            return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
        } 

        setInterval(function () {
            VerificaTimeout();
            VerificaToken();
        }, 30 * 500);

        idle({
            onIdle: function () {
            },
            onActive: function () {
                var Expiratoken = RestartTimeout();
                localStorage.setItem("timeout", Expiratoken);
            },
            idle: 2000,
            keepTracking: true
        }).start();


    </script>

</body>
</html>

