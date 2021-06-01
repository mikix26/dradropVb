<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Mapas.aspx.vb" Inherits="WebApplication1.Mapas" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


<%--    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin="" />
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
   --%>
<%--    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"/>
<link rel="stylesheet" href="https://unpkg.com/leaflet-geosearch@3.1.0/dist/geosearch.css"/>
    <link href="Content/l.geosearch.css" rel="stylesheet" />
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<script src="https://unpkg.com/leaflet-geosearch@3.1.0/dist/bundle.min.js"></script>
    <script src="Scripts/l.control.geosearch.js"></script> --%>



    <link href="Content/fontawesome-free-5.15.3-web/css/all.min.css" rel="stylesheet" />
     <link href="Content/fontawesome-free-5.15.3-web/css/fontawesome.min.css" rel="stylesheet" />
    <link href="Content/dist/leaflet.awesome-markers.css" rel="stylesheet" />
   <!-- Load Leaflet from CDN -->
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
    integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
    crossorigin=""/>
  <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
    integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
    crossorigin=""></script>
    <link href="Content/leaflet-search-master/dist/leaflet-search.min.css" rel="stylesheet" />
  <!-- Load Esri Leaflet from CDN -->
  <script src="https://unpkg.com/esri-leaflet@3.0.1/dist/esri-leaflet.js"
    integrity="sha512-JmpptMCcCg+Rd6x0Dbg6w+mmyzs1M7chHCd9W8HPovnImG2nLAQWn3yltwxXRM7WjKKFFHOAKjjF2SC4CgiFBg=="
    crossorigin=""></script>

  <!-- Load Esri Leaflet Geocoder from CDN -->
  <link rel="stylesheet" href="https://unpkg.com/esri-leaflet-geocoder@3.0.0/dist/esri-leaflet-geocoder.css"
    integrity="sha512-IM3Hs+feyi40yZhDH6kV8vQMg4Fh20s9OzInIIAc4nx7aMYMfo+IenRUekoYsHZqGkREUgx0VvlEsgm7nCDW9g=="
    crossorigin="">
  <script src="https://unpkg.com/esri-leaflet-geocoder@3.0.0/dist/esri-leaflet-geocoder.js"
    integrity="sha512-vZbMwAf1/rpBExyV27ey3zAEwxelsO4Nf+mfT7s6VTJPUbYmD2KSuTRXTxOFhIYqhajaBU+X5PuFK1QJ1U9Myg=="
    crossorigin=""></script>

    <script src="Content/leaflet-search-master/dist/leaflet-search.js"></script>
    <script src="Content/dist/leaflet.awesome-markers.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"></script>
    <script src="Content/fontawesome-free-5.15.3-web/js/fontawesome.min.js"></script>
    <script src='https://api.mapbox.com/mapbox-gl-js/v2.1.1/mapbox-gl.js'></script>
<link href='https://api.mapbox.com/mapbox-gl-js/v2.1.1/mapbox-gl.css' rel='stylesheet' />
<%--    <link rel="stylesheet" href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css" />
<script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>--%>

    <style>
    /* Formateamos el label que servirá de contenedor */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}
 
/* Ocultamos el checkbox html */
.switch input {
  display:none;
}
 
/* Formateamos la caja del interruptor sobre la cual se deslizará la perilla de control o slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}
 
/* Pintamos la perilla de control o slider usando el selector before */
.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}
 
/* Cambiamos el color de fondo cuando el checkbox esta activado */
input:checked + .slider {
  background-color: #E27AD8;
}
 
/* Deslizamos el slider a la derecha cuando el checkbox esta activado */ 
input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}
 
/* Aplicamos efecto de bordes redondeados en slider y en el fondo del slider */
.slider.round {
  border-radius: 34px;
}
 
.slider.round:before {
  border-radius: 50%;
}
        @media (min-width: 1200px) {
            .container {
                width: 100%;
            }
        }
.leaflet-popup-content-wrapper {
    background-image: url(./Content/imagenes/logopmm.png);
    background-repeat: no-repeat;
    background-position: left center;
    background-position-x: 5px;
    background-size: 65px;
    border: 2px solid #003b68;
    cursor: pointer;
    padding-left: 0px;
}
.leaflet-popup-content {
        width: 400px !important;
    padding-left: 75px;
    padding-right: 5px;
    margin: 8px 4px;
    line-height: 1.4;
        }
a.leaflet-popup-close-button {
    display: none;
}
.geocoder-control-suggestions{
    width:450px !important;
}
#buscarUnidad{
    background-color:aqua;
}
.search-tooltip {
	width: 200px;
}
.leaflet-control-search .search-cancel {
	position: static;
	float: left;
	margin-left: -22px;
}
.findbox {
	background: #eee;
	border-radius:.125em;
	border:2px solid #1978cf;
	box-shadow: 0 0 8px #999;	
	margin-bottom: 10px;
	padding: 2px 0;
	width: 600px;
	height: 26px;
}
.container{
    padding:0!important;
}
.mimenu{
    -webkit-box-shadow: 6px 3px 12px -2px rgba(0,0,0,0.75);
-moz-box-shadow: 6px 3px 12px -2px rgba(0,0,0,0.75);
box-shadow: 6px 3px 12px -2px rgba(0,0,0,0.75);
}
.fullHeight {
 
    position: absolute;
    top: 0;
    bottom: 0;
 
}
.caja{
    padding: 0 6px;
    width:100%;
    background-color:white;
    margin:8px 0;
}
input#searchtext13, input#searchtelefono {
    height: 36px;
    display: block;
    max-width: 1790px;
    width: 96%;
    margin-top: 16px;
}
.leaflet-control-search .search-button {
    /* right: 0px; */
    position: absolute;
    /* display: block; */
    /* float: right; */
    width: 34px;
    height: 31px;
    border-radius: 2px;
    margin-top: 19px;
    right: 20px;
}
.leaflet-control-search .search-cancel {
    right: 53px;
    position: absolute;
    /* float: left; */
    margin-left: -18px;
    top: 19px;
}
ul.search-tooltip {
    width: 100%;
}
.leaflet-control-search.search-exp {
   border: none; 
}
.leaflet-control-search .search-tooltip {
top: 83%;
 }
.leaflet-control-search .search-input {
   border-radius: 7px;
   padding: 15px;
 }
.miboton {
    box-sizing: border-box;
    height: 45px;
    color: white;
    border-radius: 50%;
    font-size: 25px;
    float: left;
    margin-left: 5px;
    padding: 10px;
    width: 45px;
    text-align: center;
}
.btndatos{
        margin-top: 5px;
    padding: 7px;
    background-color: aliceblue;
    font-size: 17px;
    color: #de1f00;
    border-radius: 50%;
}
.fa-ul{
    margin-bottom: 0px;
    margin-left: 0;
}
</style>



<div class="row" style="margin: 65px 0;">
     <div class="col-sm-7 mimenu fullHeight" style="padding: 0;max-width: 565px;z-index:10000;background-color:#f5f5f5;">
         <div class="caja" style="height: 70px !important;" id="buscarbox"> </div>
            <div class="caja" style="height: 70px !important;" id="">
                    <div class="leaflet-control-search search-exp">
                        <label class="search-input" for="searchtext13" style="display: none;"></label>
                        <input class="search-input" type="text" size="13" autocomplete="off"  placeholder="Buscar telefono" id="searchtelefono" style="display: block; max-width: 1790px;">
                        <ul class="search-tooltip" style="display: none;"></ul><a class="search-cancel" href="#" title="Cancel" style="display: none;"><span>⊗
                        </span></a><a class="search-button" href="#" title="Buscar Unidad"></a>
                        <div class="search-alert" style="display: none;"> </div>
                    </div>
            </div>
          <div class="caja" style=" justify-content:center;display: flex;height: 65px;padding: 10px;">
              <i class="fas fa-file-excel miboton" style="background-color:green" aria-hidden="true"></i>
          </div>

          <div class="caja" style="padding: 24px;height:75%;max-height: 75%;overflow-y: auto;">

              <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                  <Triggers>
                      <asp:AsyncPostBackTrigger ControlID="veerdatos" EventName="click" />
                  </Triggers>
                  <ContentTemplate>
                      <h4 runat="server" id="unidadSelect" style="font-weight:bold;width:100%;text-align:center"></h4>
                      <div style="width:100%;padding: 0 25px 25px 25px;">
                           <asp:Repeater id="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">

                              <ItemTemplate>
                                  <div>
                                      <i class="fas fa-map-marker" id="datosdesubic" runat="server" style="width: 100%;color:#005d94;">&nbsp&nbsp<%#Eval("DESCRIPCION") %> </i>
                                      <i class="fas fa-map-marked-alt btndatos"></i>&nbsp&nbsp<%#Eval("DIRECCION") %>
                                             <hr />
                                               <asp:Repeater id="RePEmail" runat="server">
                                                      <ItemTemplate>
                                                            <ul class="fa-ul">
                                                                  <li><span class=""><i class="fas fa-envelope btndatos"></i></span>&nbsp&nbsp<%#Eval("DESCRIPCION")%> : <%#Eval("EMAIL")%></li>
                                                            </ul>
                                                      </ItemTemplate>
                                                 </asp:Repeater>
                                                <asp:Repeater id="RepTel" runat="server">
                                                      <ItemTemplate>
                                                            <ul class="fa-ul">
                                                                  <li><span class=""><i class="fas fa-phone-alt btndatos"></i></span>&nbsp&nbsp<%#Eval("DESCRIPCION")%> : <%#Eval("TELEFONO")%></li>
                                                            </ul>
                                                      </ItemTemplate>
                                                 </asp:Repeater>
                                        <hr />
                                  </div>
                              </ItemTemplate>
                            
                         </asp:Repeater>
                    </div>
                  </ContentTemplate>
              </asp:UpdatePanel>

          </div>
     </div>
   <%-- <div class="col-sm-3">
        <asp:DropDownList runat="server" onchange="return verUnidad(this.value)" ID="selecunidad"></asp:DropDownList>
       Direccion : <input type="text" style="width: 100%;margin-top:5px" id="di"/><br />
        Codigo Postal: <input type="text" style="width: 100%;margin-top:5px"  id="cod"/><br />
         Barrio: <input type="text" style="width: 100%;margin-top:5px"  id="barrio"/><br />
        Poblacion:<input type="text" style="width: 100%;margin-top:5px"  id="po"/><br />
         Latitud: <input type="text" style="width: 100%;margin-top:5px"  id="la"/><br />
         Longitud: <input type="text" style="width: 100%;margin-top:5px"  id="lo"/><br />
     
             <div class="col-md-12 rowdatos" style="">
                  <div class="form-row">
                      <div class="form-group col-md-4">
                          <label for="inputZip">COD UNIDAD</label>
                          <input type="text" class="form-control" id="inputcodunidad">
                        </div>
                        <div class="form-group col-md-8">
                          <label for="inputEmail4">Denominación</label>
                          <input type="text" class="form-control" id="inputdesunidad" placeholder="">
                        </div>
               </div>
                  <div class="form-row">
                      <div class="form-group col-md-8">
                        <label for="inputAddress">Dirección</label>
                        <input type="text" class="form-control" id="inputdireccion" placeholder="">
                      </div>
                        <div class="form-group col-md-4">
                          <label for="inputZip">COD POSTAL</label>
                          <input type="text" class="form-control" id="inputcodpostal">
                        </div>
              </div>
                  <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="inputCity">Email</label>
                          <input type="text" class="form-control" id="inputemail">
                        </div>
             </div>
            </div>

    </div> --%>
     <div class="col-sm-12">
       <div id="mapid" style="width: 100%; height: 750px;"></div>
     </div> 
</div>
      
<%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>--%>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <div id="mapNew" style="width: 100%; height: 350px;"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>






    <label runat="server" style="display:none" id="json"></label>
    <label runat="server" style="display:none" id="jsonT"></label>


<asp:Button runat="server" ID="veerdatos" OnClick="veerdatos_Click" />
<asp:HiddenField runat="server" ID="counidad" />

<script type = "text/javascript">
    var tex = "";
  //  $(document).on("keyup", "#MainContent_listunidades", function (e) {
  //      var input = this.value.toUpperCase();
  //      tex += input;
  ////var output=document.getElementById('pro_id').options;
  //var output=this.options;
  //for(var i=0;i<output.length;i++) 
  //{
  //   if(output[i].value.includes(input))
  //   {
  //       output[i].selected=true;
  //   }                                      
  //   if(this.value=='')
  //   {
  //       output[0].selected=true;
  //   }
   
  //}
      
  //  });


function selt_busqueda() 
{
 
}

    var d;
    var puntos = {};
    
    var map = L.map('mapid').setView([40.413578687, -3.740162995], 12);
     L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
                    maxZoom: 18,
                    attribution: '<label id="coor">OpenStreetMap</label>',
                    id: 'mapbox/streets-v11',
                    tileSize: 512,
                    zoomOffset: -1
     }).addTo(map);
 var redMarker = L.AwesomeMarkers.icon({
    icon: 'business-outline',
    markerColor: 'red'
 });

 
  //var map = L.map('mapid').setView([40.413578687, -3.740162995], 12);

//var map = L.map('mapid', {
//    // Set latitude and longitude of the map center (required)
//    center: [40.413578687, -3.740162995],
//    // Set the initial zoom level, values 0-18, where 0 is most zoomed-out (required)
//    zoom: 12,
    
//});

    L.control.scale({  position:'topright'}).addTo(map);

// Create a Tile Layer and add it to the map
//var tiles = new L.tileLayer('http://{s}.tile.stamen.com/watercolor/{z}/{x}/{y}.png').addTo(map);
    //L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    //    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    //}).addTo(map);

//var geocoder = L.Control.geocoder({

//})
//    .on('markgeocode', function (e) {
//        alert(e.geocode.bbox);
//    })
//  .addTo(map);

    var searchControl = new L.esri.Geocoding.geosearch({
        providers: [L.esri.Geocoding.arcgisOnlineProvider({
            apikey: 'AAPKe59835b6e78c4a4c8e9bdba4a0d8ea9bVunym2rWdMzB7XopTeZxBntHXqeqUfwthl_Pj3XsBBMcAVS6D0N3AG3IV_iYDlan', // replace with your api key - https://developers.arcgis.com
            nearby: {
                lat: 40.413578687,
                lng: -3.740162995
            }
        })],
        position: 'topright',
        useMapBounds: false,
        placeholder: 'Buscar dirección....',
        expanded: true,
        collapseAfterResult: false
    }).addTo(map);
  var results = new L.LayerGroup().addTo(map);
    var layer;

    searchControl.on('results', function (data) {
        d = data;
    results.clearLayers();
    for (var i = data.results.length - 1; i >= 0; i--) {
        layer =L.marker(data.results[i].latlng, {icon: redMarker, draggable: true }).addTo(results)
            .on('drag', function (e) {
             
                var lat = e.latlng.lat;
                var long = e.latlng.lng;
                layer.openPopup();
                $("#newpoint").text(lat + ", " + long);
                L.esri.Geocoding.reverseGeocode()
                    .apikey('AAPKe59835b6e78c4a4c8e9bdba4a0d8ea9bVunym2rWdMzB7XopTeZxBntHXqeqUfwthl_Pj3XsBBMcAVS6D0N3AG3IV_iYDlan')
                      .latlng([lat, long])
                      .run(function (error, result, response) {
                        // callback is called with error, result, and raw response
                        // result.latlng contains the coordinates of the located address
                        // result.address contains information about the match
                          $("#dr").text(result.address.Address);
                     layer.bindPopup("<span id='dr' style='color: #003b67;'>" + result.address.Match_addr + "</span><br/><span  id='newpoint'> " + lat + ","+long  + "</span><br/><a onclick='guardarUbicacion(\"" + result.address.Match_addr + "\",\""+lat+"\",\""+long+"\");'>Guardar</a>").openPopup();

                      });

            })
            .bindPopup("<span id='dr' style='color: #003b67;'>" + data.results[i].text + "</span><br/><span  id='newpoint'> " + data.results[i].latlng.lat + ","+data.results[i].latlng.lng  + "</span><br/><a onclick='guardarUbicacion(\"" + data.results[i].text + "\",\""+data.results[i].latlng.lat+"\",\""+data.results[i].latlng.lng+"\");'>Guardar</a>").openPopup();
    results.addLayer(layer);
    }
    });

//    map.addControl( new L.Control.Search({
//		url: 'http://nominatim.openstreetmap.org/search?format=json&q={s}',
//		jsonpParam: 'json_callback',
//		propertyName: 'display_name',
//		propertyLoc: ['lat','lon'],
//		marker: L.marker([0,0]).addTo(map).on('click', getLatLon),
//		autoCollapse: true,
//		autoType: false,
//		minLength: 2
//	})    
//  );
  
//  function getLatLon(e) {
//    alert(this.getLatLng());
//}

   var DATA = JSON.parse($("#MainContent_json").text());
   //var listaT = JSON.parse($("#MainContent_jsonT").text());

    // $.ajax({
    //    type: "POST",
    //    url: "Default.aspx/GetCurrentTime",
    //    data: '{valor:"'+$(id).val()+'", id:"'+ idfila +'"}',
    //    contentType: "application/json; charset=utf-8",
    //    dataType: "json",
    //    success: OnSuccess,
    //    failure: function(response) {
           
    //    }

	var markersLayer = new L.LayerGroup();	//layer contain searched elements
	//var markersLayerT = new L.LayerGroup();
    map.addLayer(markersLayer);
    //map.addLayer(markersLayerT);
<%--var geojsonMarkerOptions2 = {
radius: 5,
fillColor: "#ffc34d",
color: "#1a1100",
weight: 1,
opacity: 1,
fillOpacity: 0.4
};
      var GeoUbicacion = <%=geoSonUbi%>;
var poiLayers = L.geoJSON(GeoUbicacion,{
   pointToLayer: function (feature, latlng) {
    feature.properties.myKey = feature.properties.codunidad + '-' + feature.properties.descripcion
           return L.circleMarker(latlng, geojsonMarkerOptions2);
  },
  onEachFeature: function (feature, layer) {
      layer.bindPopup("<b style='color: #003b67;'>"+feature.properties.descripcion+"</b><br/>" + feature.properties.direccion +"<br/><a onclick='CargaDatosUnidad("+feature.properties.codunidad+");'>Ampliar</a>");
  }
}).addTo(map);
   
   var fuseOptions = {
  shouldSort: true,
  tokenize: true,
  threshold: 0,
  location: 0,
  distance: 100,
  maxPatternLength: 32,
  minMatchCharLength: 2,
  keys: ['properties.myKey']
};

var fuse = new Fuse(GeoUbicacion.features, fuseOptions);

 --%>

    var controlSearch2 = new L.Control.Search({
        container:'buscarbox',
        layer: markersLayer,
         textPlaceholder: 'Buscar Unidad',
        collapsed: false,
        zoom: 25,
        	initial: false,	
            marker: {						//custom L.Marker or false for hide
                icon: false,				//custom L.Icon for maker location or false for hide
                animate: true,				//animate a circle over location found
                circle: {					//draw a circle in location found
                    radius: 10,
                    weight: 10,
                    color: '#e03',
                    stroke: true,
                    fill: false
                }
            }

	});
  map.addControl(controlSearch2);

 //   var controlSearch3 = new L.Control.Search({
 //       position: 'topleft',
 //       layer: markersLayerT,
 //        textPlaceholder: 'Buscar Telefono...',
 //       collapsed: true,
 //       zoom: 25,
 //       	initial: false,	
 //           marker: {						//custom L.Marker or false for hide
 //               icon: false,				//custom L.Icon for maker location or false for hide
 //               animate: true,				//animate a circle over location found
 //               circle: {					//draw a circle in location found
 //                   radius: 3,
 //                   weight: 5,
 //                   color: '#e03',
 //                   stroke: true,
 //                   fill: false
 //               }
 //           }

	//});
 //   map.addControl(controlSearch3);

    controlSearch2.on('search:locationfound', function (data) {
        $("#MainContent_counidad").val(data.layer.options.alt);
        $("#MainContent_veerdatos").click();
      data.layer.openPopup();
    });

  	//$('#searchtext13').on('keyup', function(e) {
   //         $.ajax({
   //             type: "POST",
   //             url: "Default.aspx/GetCurrentTime",
   //             data: '{q:"' + $(this).val() + '"}',
   //             contentType: "application/json; charset=utf-8",
   //             dataType: "json",
   //             success: OnSuccess,
   //             failure: function (response) {

   //             }

   //         });
   //  });

    

    for (var item of DATA) 
    {
        var f = "";var dt = "";
       if (item.LATITUD == "" || item.LATITUD == null) {
            item.LATITUD = 40.419566;
            item.LONGITUD = -3.732682;
        }
           if (item.DESCRIPCION == "" || item.DESCRIPCION == null) {
            item.DESCRIPCION = 'SIN NOMBRE';
        }
        var unidad = item.COD_UNIDAD.toString();
        var u = unidad.substr(-3);
        switch (u) {
              case "000":
                redMarker = L.AwesomeMarkers.icon({
                                 prefix:'fa',
                                icon: 'building',
                                markerColor: 'red'
                             });
                break;

              default:
                redMarker = L.AwesomeMarkers.icon({
                                 prefix:'fa',
                                icon: 'fa-warehouse',
                                markerColor: 'blue'
                             });
                break;
        }

        var popup = L.popup();
   
        //for (var t of listaT) {
        //    if (t.ID_UBICACION == item.ID) {
        //        f += "<br/><i class='fas fa-phone-alt'> " + t.DESCRIPCION + ": " + t.TELEFONO + "</i> ";
        //        //L.marker([item.LATITUD, item.LONGITUD], {opacity:0, title: t.TELEFONO , draggable: true }).addTo(markersLayerT)
                
        //    }
             
        //    }
        puntos['MARKER' + item.COD_UNIDAD] = L.marker([item.LATITUD, item.LONGITUD], { icon: redMarker, title: item.COD_UNIDAD +"-"+item.DESCRIPCION, alt: item.COD_UNIDAD, draggable: true }).addTo(markersLayer)
             .on('drag', function (e) {
             
                var lat = e.latlng.lat;
                var long = e.latlng.lng;
                L.esri.Geocoding.reverseGeocode()
                    .apikey('AAPKe59835b6e78c4a4c8e9bdba4a0d8ea9bVunym2rWdMzB7XopTeZxBntHXqeqUfwthl_Pj3XsBBMcAVS6D0N3AG3IV_iYDlan')
                      .latlng([lat, long])
                      .run(function (error, result, response) {
                        // callback is called with error, result, and raw response
                        // result.latlng contains the coordinates of the located address
                        // result.address contains information about the match
                          $("#dr").text(result.address.Address);
                     e.target.bindPopup("<span id='dr' style='color: #003b67;'>" + result.address.Match_addr + "</span><br/><span  id='newpoint'> " + lat + ","+long  + f+"<br/></span><br/><a onclick='guardarUbicacion(\"" + result.address.Match_addr + "\",\""+lat+"\",\""+long+"\");'>Guardar</a>").openPopup();

                      });

            })

            .bindPopup("<b style='color: #003b67;'>" + item.DESCRIPCION + "</b><br/>" + item.DIRECCION +f+ "<br/><a onclick='CargaDatosUnidad(" + item.COD_UNIDAD + ");'>Ampliar</a>")
           
     }



    function guardarUbicacion(d,la,lo) {
        var datos = d.split(',');

        $("#di").val(datos[0]);
        $("#cod").val(datos[1]);
        $("#barrio").val(datos[2]);
        $("#po").val(datos[3]);
        $("#la").val(la);
         $("#lo").val(lo);
    }



    function verUnidad(cod) {
        var x = puntos["MARKER" + cod]._latlng.lat;
        var y = puntos["MARKER" + cod]._latlng.lng;
        map = map.setView([x, y], 30);
        puntos["MARKER" + cod].openPopup();
    }


    function OnSuccess(response) {
        puntos = {};
        markersLayer.clearLayers();
        var DATA = JSON.parse(response.d);
         for (var item of DATA) 
    {
       if (item.LATITUD == "" || item.LATITUD == null) {
            item.LATITUD = 40.419566;
            item.LONGITUD = -3.732682;
        }
           if (item.DESCRIPCION == "" || item.DESCRIPCION == null) {
            item.DESCRIPCION = 'SIN NOMBRE';
        }
        var unidad = item.COD_UNIDAD.toString();
        var u = unidad.substr(-3);
        switch (u) {
              case "000":
                redMarker = L.AwesomeMarkers.icon({
                                 prefix:'fa',
                                icon: 'building',
                                markerColor: 'red'
                             });
                break;

              default:
                redMarker = L.AwesomeMarkers.icon({
                                 prefix:'fa',
                                icon: 'fa-warehouse',
                                markerColor: 'blue'
                             });
                break;
        }

         popup = L.popup();

        puntos['MARKER' + item.COD_UNIDAD] = L.marker([item.LATITUD, item.LONGITUD], { icon: redMarker, title: item.DESCRIPCION, alt: item.COD_UNIDAD , draggable: true }).addTo(markersLayer)
             .on('drag', function (e) {
             
                var lat = e.latlng.lat;
                var long = e.latlng.lng;
                L.esri.Geocoding.reverseGeocode()
                    .apikey('AAPKe59835b6e78c4a4c8e9bdba4a0d8ea9bVunym2rWdMzB7XopTeZxBntHXqeqUfwthl_Pj3XsBBMcAVS6D0N3AG3IV_iYDlan')
                      .latlng([lat, long])
                      .run(function (error, result, response) {
                        // callback is called with error, result, and raw response
                        // result.latlng contains the coordinates of the located address
                        // result.address contains information about the match
                          $("#dr").text(result.address.Address);
                     e.target.bindPopup("<span id='dr' style='color: #003b67;'>" + result.address.Match_addr + "</span><br/><span  id='newpoint'> " + lat + ","+long  + "</span><br/><a onclick='guardarUbicacion(\"" + result.address.Match_addr + "\",\""+lat+"\",\""+long+"\");'>Guardar</a>").openPopup();

                      });

            })

           .bindPopup("<b style='color: #003b67;'>"+item.DESCRIPCION+"</b><br/>" + item.DIRECCION +"<br/><a onclick='CargaDatosUnidad("+item.COD_UNIDAD+");'>Ampliar</a>").openPopup();
     }
}
    function CargaDatosUnidad(cod_unidad) {
        $.ajax({
            type: "POST",
            url: "Default.aspx/DatosUnidad",
            data: '{codunidad:"' + cod_unidad + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSucces,
            failure: function (response) {

            }
        });
        function OnSucces(response) {
            var DATA = JSON.parse(response.d);

            $("#inputcodunidad").val(DATA[0].COD_UNIDAD);
            $("#inputdesunidad").val(DATA[0].DES_UNIDAD);
            $("#inputdireccion").val(DATA[0].DIRECCION);
            $("#inputcodpostal").val(DATA[0].COD_POSTAL);
            $("#inputemail").val(DATA[0].EMAIL);
            $(".rowdatos").slideDown();
        }
    }


</script>

</asp:Content>

