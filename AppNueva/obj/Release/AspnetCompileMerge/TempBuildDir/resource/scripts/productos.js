var $n = $("#idPage");
var $c = $('#contenido');

var appname = "/";

$("#verCatalogo").live('click', function () {
    tempProd.init();
});

$("#verCategoria").live('click', function () { 
    var value = $(this).attr('data-id');
    var key = $(this).attr('key');
    tempProd.verProductos(value);
    nodo = {};
    nodo.prod = key;
    
});

$("#verColores").live('click', function () {
    var value = $(this).attr('data-id');
    var key = $(this).attr('key');
    tempProd.verProdbyColor(value);
    nodo.codigo = {};
    nodo.codigo = key;
});


$("#verImagen").live('click', function () {
    $(".modal").css("display", "block");
    $("#titulo").append($(this).attr('data-nombreprod'));
    $(".contenidoimagen").append('<img src="' + $(this).attr('data-url') + '" class="img-responsive">')
});

$(".close").live('click', function () {
    $(".modal").css("display", "none");
    $("#titulo").empty();
    $(".contenidoimagen").empty();
});
$("#btnEnviar").live('click', function () {
    tempProd.enviarMensaje();
});



tempProd = {
    cats: {},    
    init: function () {
        nodo = {};
        tempProd.verCate();        
    },
    verCate: function () {
        //param = { "token": (localStorage.getItem("token") != null) ? localStorage.getItem("token") : "" };
                           //(localStorage.getItem("token") != null) ? localStorage.getItem("token") : "";
        //param = { "token": (localStorage.getItem("token") != null) ? localStorage.getItem("token") : ""};
        

        param = { "token": (localStorage.getItem("token") != null) ? localStorage.getItem("token") : ""};                

        $.ajax({
            type: "POST",
            url: "/Default.aspx/showCategoria",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(param),
            beforeSend: function () {
                tempProd.verMensaje();
            },
            success: function (data) {
                var listCat = JSON.parse(data.d)       
                
                $c.empty();
                if (listCat.length != 0) {
                    for (var i = 0; i < listCat.length; i++) {                        
                        var $col = $('<div  class="col-sm-3 cuadro"> <div class="panel panel-default"> <div class="panel-heading">' + listCat[i].Nombre + ' </div>' +
                                        '<div class="panel-body"  ><div class="mimagen"  ><a class="iconpoint" id="verCategoria" key="' + i + '"  data-id="' + listCat[i].Id + '"><img class="img-responsive "    src="' + listCat[i].UrlImagen + '"  ></a></div>' +
                                        '<br><p class="text-justify">' + listCat[i].Descripcion + '</p><a  id="verCategoria" class="btn btn-send " key="' + i + '"  data-id="' + listCat[i].Id + '"   > Ver Modelos</a></div></div>');
                        
                        $c.append($col);
                    }


                    tempProd.cats = listCat;

                } else {
                    $c.html('<div class="text-center"><img src="resource/img/warning.png" /></div><br><div class="text-center">Catologo no disponible</div> ');
                }
                
            },
            complete: function () {
               tempProd.verLink();
            }
        });
    },
    verProductos: function (val) {
        params ={};
        params.id = val;
        //param = { "token": (localStorage.getItem("token") != null) ? localStorage.getItem("token") : "" };
        params.token = JSON.stringify((localStorage.getItem("token") != null) ? localStorage.getItem("token") : "");
            
        $.ajax({
            type: "GET",
            url: "/Default.aspx/showProductos",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data:params,
            beforeSend: function () {
                tempProd.verMensaje();
            },
            success: function (data) {
                var listProds = JSON.parse(data.d);          

                $c.empty();
                if (listProds.length != 0) {
                    var $sidemenu = $('<div class="row"><h3>' + tempProd.cats[nodo.prod].Nombre + '</h3><p>' + tempProd.cats[nodo.prod].Descripcion + '</p></div><br>');
                    var $content = $('<div class="row">');

                    $c.append($sidemenu);
                    
                    for (var i = 0; i < listProds.length; i++) {

                        var $col = $('<div class="col-md-3 cuadro"> <div class="panel panel-default"> <div class="panel-heading">' + listProds[i].CodigoCompleto + ' </div>' +
                                          '<div class="panel-body"><div class=" mimagen"><a class="iconpoint" id="verColores" key="' + i + '" data-id="' + listProds[i].Id + '" ><img class="img-responsive "   src="' + listProds[i].UrlImagen + '" ></a></div>' +
                                          '<h5>' + listProds[i].Nombre + '</h5>' +
                                          '<h5> ' + listProds[i].Mezcla + ' - ' + listProds[i].Titulo + '</h5>' +
                                          '<a  class="btn btn-send"  id="verColores" key="' + i + '" data-id="' + listProds[i].Id + '"   >Ver Colores</a></div>');
                        $content.append($col);
                    }
                    $c.append($content);
                  //  alert(tempProd.cats[nodo.prod].Id)
                    tempProd.cats[nodo.prod].prods = listProds;
                    
                } else {
                    $c.html('<div class="text-center"><img src="resource/img/warning.png" /></div><br><div class="text-center">No existe Informacion de este Modelo...!!!</div> ');
                }
                
            },
            complete: function () {
                tempProd.verLink();
            }
        });
    },

    verProdbyColor: function (val) {
        params = {};
        params.id = val;
        params.token = JSON.stringify((localStorage.getItem("token") != null) ? localStorage.getItem("token") : "");

        $.ajax({
            type: "GET",
            url: "/Default.aspx/showProdsByColor",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: params,
            beforeSend: function () {
                tempProd.verMensaje(); 
               
            },
            success: function (data) {
                var listProdColors = JSON.parse(data.d)
                var $sidemenu = $('<div class="col-md-3">'+
                                        '<div class="panel panel-default">' +
                                            '<div class=" panel-heading"><h3>' + tempProd.cats[nodo.prod].prods[nodo.codigo].CodigoCompleto + '</h3><h4>(Colores)</h4></div>' +
                                            '<div class=" panel-body"><h4>' + tempProd.cats[nodo.prod].prods[nodo.codigo].Nombre + '</h4>' +
                                                  ' <h5>Detalles del Producto: <h5>' +
                                                  'MEZCLA: <p>' + tempProd.cats[nodo.prod].prods[nodo.codigo].Mezcla +'</p>'+
                                                  'TITULO: <p>' + tempProd.cats[nodo.prod].prods[nodo.codigo].Titulo + '</p>' +
                                                  'BORDE: <p>' + tempProd.cats[nodo.prod].prods[nodo.codigo].Borde + '</p>' +
                                                  'PELO: <p>' + (tempProd.cats[nodo.prod].prods[nodo.codigo].Pelo = 'true' ? "SI" :"NO") + '</p>' +
                                                  'PESO EN KG: <p>' + tempProd.cats[nodo.prod].prods[nodo.codigo].Peso + '</p>' +
                                                  'MEDIDAS: <p style="font-size:9px">(Ancho x largo sin flecos / fleco x lado)</p> <p>' + tempProd.cats[nodo.prod].prods[nodo.codigo].Medidas + '</p>' +
                                              ' </div>' +
                                        ' </div> </div>  ');
               
                
                $c.empty();
                if (listProdColors.length != 0) {
                    $c.append($sidemenu);
                    var $content = $('<div class=" col-md-9">');
                    for (var i = 0; i < listProdColors.length; i++) {
                        var $col = $('<div  class="col-md-4 ">' +
                                    '<div class="panel panel-default"> <div class="panel-heading">Color N° ' + listProdColors[i].Nro + '</div>' +
                                    //'<div class="panel panel-default"> <div class="panel-heading">Color N° ' + (i + 1) + '</div>' +
                                            '<div class="panel-body">' +
                                                '<div class=" mimagen"  > <img class="img-responsive iconimg"  title="Ver Imagen"   id="verImagen" data-url="' + listProdColors[i].UrlImagen + '" data-nombreprod="' + tempProd.cats[nodo.prod].prods[nodo.codigo].CodigoCompleto + '" src="' + listProdColors[i].UrlImagen + '" ></div><br>' +
                                                 'URD: <p>' + listProdColors[i].ColoresUrdimbre + '</p>  TRM: <p>' + listProdColors[i].ColoresTrama + '</p> ' +
                                                 'Ref.: <p>' + (listProdColors[i].ColorReferencial = 'null' ? "Sin Referencia" : listProdColors[i].ColorReferencial) + '</p></div>' +
                                            '</div>' +
                                        '</div>' +
                                      '</div></div>');

                        $content.append($col);
                    }
                    $c.append($content);
                //    alert(tempProd.cats[3].prods[0].Id)
                    tempProd.cats[nodo.prod].prods[nodo.codigo].colores = listProdColors;
                } else {
                    $c.html('<div class="text-center"><img src="resource/img/warning.png" /></div><br><div class="text-center">No existe Informacion de este Modelo...!!!</div> ');
                }

               
            },
            complete: function () {
                tempProd.verLink();
            }



        });
    },
    verLink: function () {
        var li='';
        $('#link').empty();
        
        
       if (nodo.prod != null ) {
           
           li += '<li ><a id="verCatalogo"  href="javascript:void(0);"> "Categorias" </a></li>';
           li += '<li ><a id="verCategoria"  key="' + nodo.prod + '" data-id="' + tempProd.cats[nodo.prod].Id + '" href="javascript:void(0);">"' + tempProd.cats[nodo.prod].Nombre + '"</a></li>';
               if (nodo.codigo != null) {
                   li += '<li ><a id="verColores"  key="' + nodo.codigo + '" data-id="' + tempProd.cats[nodo.prod].prods[nodo.codigo].Id + '" href="javascript:void(0);">"' + tempProd.cats[nodo.prod].prods[nodo.codigo].CodigoCompleto + ' | Colores"</a></li>';

               }
            
           
        } else {
           li += '<li ><a  id="verCatalogo" href="javascript:void(0);"> "Categorias" </a></li>';
        }
        
       $('#link').append(li);
    },
    verMensaje: function () {
        $c.html('<div class="text-center"><img src="resource/img/flat-gear.gif" /></div><br><div class="text-center">Cargando Datos...</div> ');
    },
    enviarMensaje: function () {
        params = {};
        params.name = $('#name').val();
        params.email = $('#email').val();
        params.descrip = $('#descrip').val();

        //alert($('#name').val() + $('#email').val() + $('#descrip').val());


        $.ajax({
            type: "POST",
            url: "/Default.aspx/enviarMsj",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: '{name:"' + $('#name').val() + '",email:"' + $('#email').val() + '",descrip:"' + $('#descrip').val() + '"}',
            beforeSend: function () {                
                $('#load').html('<img style="width:5%;height:5%;" src="resource/img/flat-gear.gif" /> Cargando Datos... ');
            },
            success: function (data) {
           
                $('#name').val('');
                $('#email').val('');
                $('#descrip').val('');
                $('#load').html('<img style="width:5%;height:5%;" src="resource/img/check.png" />&nbsp' + data["d"]);
            },
        });
    }  
};


tempProd.init();



