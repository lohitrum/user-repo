<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hilados.aspx.cs" Inherits="WebApp.Paginas.Hilados" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Illary Joste S.R.L - Hilados</title>
        
        <link rel="stylesheet" type="text/css" href="../resource/css/bootstrap.min.css" />
<%--        <link rel="stylesheet" type="text/css" href="../resource/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="../resource/css/animate.css" />--%>
        <link rel="stylesheet" type="text/css" href="../resource/css/style.css" />

        <style>
            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }

                100% {
                    transform: rotate(360deg);
                }
            }

            .jm-loadingpage {
                position: fixed;
                left: 0px;
                top: 0px;
                width: 100%;
                height: 100%;
                z-index: 999999999;
                background: url(../resource/img/loader.gif) center no-repeat #fff;
            }

            .error-server {
                display: none;
                position: fixed;
                left: 0px;
                top: 0px;
                width: 100%;
                height: 100%;
                z-index: 999999999;
                background:#fff;
            }
            .error__active {
                text-align: center;
                padding: 60px 0;

            }
            .error__active img {
                max-width: 400px;    
                width: auto;
            }
            .aviso__alerta {
                margin-top: 50px;
            }
            .aviso__alerta h2{
                font-size: 22px;
            }

        </style>
    </head>

    <body>
        <div class="error-server error__active">
            <img src="../resource/img/disconect.png" />
            <div class="alert alert-warning aviso__alerta"><h2>El servicio se encuentra disponible de 8 a.m a 5 p.m hora Perú. Disculpe los inconvenientes.</h2></div>
            <p>Por favor intentarlo mas tarde</p>
        </div>
        
        <div class="jm-loadingpage"></div>

        <div class="section-padding wow fadeInUp delay-02s" id="empresa">
            <div class="container">
                <div class="row top-pad">
                    <div class="col-md-4 col-sm-12">
                        <div class="section-title">
                            <h2 class="head-title black">Almacen Hilados</h2>
                            <hr class="botm-line" />

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div id="combMezclas" class="col-md-3 col-sm-12">

                    </div>

                    <div id="combTitulos" class="col-md-3 col-sm-12">

                    </div>

                    <div id="inputCodColor" class="col-md-3 col-sm-12">
                        <label for="codColor">Codigo de Color (OPCIONAL):</label>
                        <input type="text" class="form-control" id="codColor" placeholder="Ejemplo: AZ1660">
                    </div>

                    <div class="col-md-3 col-sm-12">
                        <div class="form-group">
                            <br />
                            <button style="width: 100%" type="button" id="btnBuscar" class="btn btn-send">Buscar</button>
                            <span class="text-right" id="load"></span>
                        </div>
                    </div>
                </div>

                <div id="tablaIlados" class="row">

                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Mezcla</th>
                                <th>Composicion</th>
                                <th>Titulo</th>
                                <th>Codigo de color</th>
                            </tr>
                        </thead>

                        <tbody>

                        </tbody>
                    </table>
                </div>

                <div class="row">
                </div>
            </div>
        </div>

        <script src="../resource/js/jquery.min.js"></script>
        <script src="../resource/js/jquery.easing.min.js"></script>
        <script src="../resource/js/bootstrap.min.js"></script>
<%--        <script src="../resource/js/wow.js"></script>
        <script src="../resource/js/custom.js"></script>--%>

        <script type="text/javascript">
            var $tab = $('#tablaIlados');
            var $mez = $('#combMezclas');
            var $tit = $('#combTitulos');
            var $cco = $('#codColor');

            $(document).ready(function () {
                $(".jm-loadingpage").show();

                $(window).load(function () {
                    tempProdTwo.init();
                });
            });

            function argbToRGB(color) {
                return '#'+ ('000000' + (color & 0xFFFFFF).toString(16)).slice(-6);
            }

            function colorText(value) {
                if (value) {
                    return "white";
                }
                else {
                    return "black";
                }
            }

            tempProdTwo = {
                cats: {},    
                init: function () {
                    tempProdTwo.verMezclas();
                    tempProdTwo.verTitulos();
                },
                verMezclas: function () {
                    $.ajax({
                        type: "POST",
                        url: "/Default.aspx/getMezclas",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        beforeSend: function () {
                            $mez.html('<br/><div class="text-center"><img src="../resource/img/loader2.gif" width="10%" />'); 
                        },
                        success: function (data) {
                            var listMezclas = JSON.parse(data.d)

                            $mez.empty();
                            if (listMezclas.length != 0) {

                                var $opt = '';

                                for (var i = 0; i < listMezclas.length; i++) {
                                    $opt = $opt + '<option>' + listMezclas[i] + '</option>';
                                }

                                var $col = '<div id="lm_element" class="form-group"> <label for="sel1">Lista de Mezclas:</label> <select class="form-control" id="sel1">' + $opt + '</select> </div>';

                                $mez.append($col);
                                tempProdTwo.cats = listMezclas;

                            } else {
                                $mez.html('<div class="text-center"><img src="../resource/img/warning.png" width="50%" /></div><br><div class="text-center">Catologo no disponible</div> ');
                            }
                        },
                        timeout: 30000,
                        error: function () {
                            $(".jm-loadingpage").hide();
                            $(".error-server").show();
                        },
                        complete: function () {
                            if ( $( "#lm_element" ).length && $( "#lt_element" ).length) {
                                $(".jm-loadingpage").hide();
                            }
                        }
                    });
                },
                verTitulos: function () {
                    $.ajax({
                        type: "POST",
                        url: "/Default.aspx/getTitulos",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        beforeSend: function () {
                            $tit.html('<br/><div class="text-center"><img src="../resource/img/loader2.gif" width="10%" />'); 
                        },
                        success: function (data) {
                            var listTitulos = JSON.parse(data.d)

                            $tit.empty();
                            if (listTitulos.length != 0) {

                                var $opt = '';

                                for (var i = 0; i < listTitulos.length; i++) {
                                    $opt = $opt + '<option>' + listTitulos[i] + '</option>';
                                }

                                var $col = '<div id="lt_element" class="form-group"> <label for="sel2">Lista de Titulos:</label> <select class="form-control" id="sel2">' + $opt + '</select> </div>';

                                $tit.append($col);

                            } else {
                                $tit.html('<div class="text-center"><img src="../resource/img/warning.png width="50%"" /></div><br><div class="text-center">Hilados no disponible</div> ');
                            }
                        },
                        timeout: 30000,
                        error: function () {
                            $(".jm-loadingpage").hide();
                            $(".error-server").show();
                        },
                        complete: function () {
                            if ( $( "#lm_element" ).length && $( "#lt_element" ).length) {
                                $(".jm-loadingpage").hide();
                            }
                        }
                    });
                }
            };

            $("#btnBuscar").click(function () {

                if ($("#combMezclas option:selected").text() != "" && $("#combMezclas option:selected").text() != "undefined" && $("#combTitulos option:selected").text() != "" && $("#combTitulos option:selected").text() != "undefined") {

                    params = {
                        "combMezclas": $("#combMezclas option:selected").text(),
                        "combTitulos": $("#combTitulos option:selected").text(),
                        "codColor": $('#codColor').val()
                    }

                    $.ajax({
                        type: "POST",
                        url: "../Default.aspx/getHilados",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify(params),
                        beforeSend: function () {
                            $tab.html('<br/><br/><div class="text-center"><img src="../resource/img/flat-gear.gif" /></div><br><div class="text-center">Cargando Datos...</div> '); 
                        },
                        success: function (data) {

                            var listHilados = JSON.parse(data.d)

                            $tab.empty();

                            if (listHilados.length != 0) {

                                var $opt = '';
                    
                                for (var i = 0; i < listHilados.length; i++) {
                                    var $td_mez = '<td>' + listHilados[i].NombreComercial + '</td>';
                                    var $td_com = '<td>' + listHilados[i].Composicion + '</td>';
                                    var $td_cod = '<td><center><p style="color:' + colorText(listHilados[i].TextoBlanco) + '; background: ' + argbToRGB(listHilados[i].MuestraColor) + ';"><b>' + listHilados[i].CodigoColor + '</b></p></center></td>';
                                    var $td_tit = '<td>' + listHilados[i].Titulo + '</td>';

                                    $opt = $opt + '<tr>' + $td_mez + $td_com + $td_tit + $td_cod + '</tr>';
                                }

                                var $col = '<table class="table table-hover"> <thead> <tr> <th>Mezcla</th> <th>Composicion</th> <th>Titulo</th> <th><center>Codigo de color</center></th> </tr> </thead> <tbody> ' + $opt + '</tbody> </table>';

                                $tab.append($col);
                            }
                            else {
                                $tab.html('<div class="text-center"><img src="../resource/img/warning.png" /></div><br><div class="text-center">Hilados no disponible</div> ');
                            }
                        },
                        complete: function () {

                        }
                    });
                }
                else {
                    console.log("No entro");
                    return false;
                }
            });

        </script>

    </body>
</html>

