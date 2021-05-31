<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="WebApplication1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="Scripts/dropzone.js"></script>
 <style>
    html, body {
      height: 100%;
    }
    #actions {
      margin: 2em 0;
    }


    /* Mimic table appearance */
    div.table {
      display: table;
    }
    div.table .file-row {
      display: table-row;
    }
    div.table .file-row > div {
      display: table-cell;
      vertical-align: middle;
      border-top: 1px solid #ddd;
      padding: 0px;
    }
	 .file-row div > p{
	 margin:0;
	 }
    div.table .file-row:nth-child(odd) {
      background: #f9f9f9;
    }



    /* The total progress gets shown by event listeners */
    #total-progress {
      opacity: 0;
      transition: opacity 0.3s linear;
    }

    /* Hide the progress bar when finished */
    #previews .file-row.dz-success .progress {
      opacity: 0;
      transition: opacity 0.3s linear;
    }

    /* Hide the delete button initially */
    #previews .file-row .delete {
      display: none;
    }

    /* Hide the start and cancel buttons and show the delete button */

    #previews .file-row.dz-success .start,
    #previews .file-row.dz-success .cancel {
      display: none;
    }
    #previews .file-row.dz-success .delete {
      display: block;
    }
.dropzone{
    background: #f7f7f7;
    text-align: center;
    border: 2px dashed #71bdff;
    height: 200px;
}
.preview img{
  width:25px ;
}
  </style>

<div class="jumbotron" style="margin-top:50px">
      <div class="col-lg-7">  
          
        <button type="submit" class="btn btn-primary start">
            <i class="fas fa-cloud-upload-alt"></i>
            <span>Guardar</span>
        </button>
      </div>

    <div  class="dropzone" id="dropzoneForm">
        <div class="fallback">
            <input name="file" type="file" multiple />
            <input type="submit" class="btn btn-primary start" value="Upload" />
        </div>
        <div class="row col-12">
         <i class="fas fa-cloud-upload-alt" style="font-size:73px;color: #71bdff;"></i>
                  </div>
                    <div class="row col-12">
                    <h3>Arrastrar y soltar para añadir archivo</h3>
                  </div>
                    <div class="row col-12">
                      <span class="btn btn-primary fileinput-button">
                        <span>O Selecciona Archivos....</span>
                    </span>
   
                  </div>
    </div>
        <div class="table table-striped files" id="previews" style="">

      <div id="template" class="file-row row align-items-center">

        <!-- This is used as the file preview template -->
        <div class="col-4 align-self-center">
            <span class="preview"><img data-dz-thumbnail /></span>
        </div>
        <div class="col-2 align-self-center">
            <p class="name" data-dz-name></p>
            <strong class="error text-danger" data-dz-errormessage></strong>
        </div>
        <div class="col-5 align-self-center">
            <p class="size" data-dz-size></p>
        </div>
        <div class="col-1 align-self-center">
          <i data-dz-remove class="fas fa-trash-alt cancel" style="height:15px;width:15px;color:red"></i>
        </div>
      </div>

    </div>
</div>
    <script>
         var previewNode = document.querySelector("#template");
      previewNode.id = "";
      var previewTemplate = previewNode.parentNode.innerHTML;
      previewNode.parentNode.removeChild(previewNode);
 //File Upload response from the server
        Dropzone.options.dropzoneForm = {
            thumbnailWidth: 80,
        thumbnailHeight: 80,
        parallelUploads: 20,
        dictDefaultMessage:"",
            previewTemplate: previewTemplate,
         autoProcessQueue: false,
        autoQueue: true, // Make sure the files aren't queued until manually added
        previewsContainer: "#previews", // Define the container to display the previews
        clickable: ".fileinput-button", // Define the element that should be used as click trigger to select files.
            url: "Contact.aspx",
            init: function () {
                var mydrop = this;
                this.on("addedfile", function (file) {
                     var ext = file.name.split('.').pop();

                      if (ext == "pdf") {
                          file.previewElement.querySelector(".preview img").setAttribute("src", "./imagenes/Pdf_logo.png");
                      } else if (ext.indexOf("doc") != -1) {
                          file.previewElement.querySelector(".preview img").setAttribute("src", "./imagenes/Word_logo.png");
                      } else if (ext.indexOf("xls") != -1) {
                          file.previewElement.querySelector(".preview img").setAttribute("src", "./imagenes/Excell_logo.png");
                      } else if (!(/\.(jpg|png|gif)$/i).test(ext)){
                        file.previewElement.querySelector(".preview img").setAttribute("src", "./imagenes/Default_logo.png");
                      }
                   
                
                });
                this.on("processing", function() {
                        this.options.autoProcessQueue = true;
                    });
                 this.on("dragover", function(e) {
                    document.querySelector(".dropzone").style.backgroundColor = "#e3f5ff";
                    document.querySelector(".dropzone").style.border="4px dashed #71bdff";
                  });
                  this.on("dragleave", function(e) {
                    document.querySelector(".dropzone").style.backgroundColor = "#f7f7f7";
                    document.querySelector(".dropzone").style.border="2px dashed #71bdff";
                  });
                     this.on("drop", function(e) {
                    document.querySelector(".dropzone").style.backgroundColor = "#f7f7f7";
                    document.querySelector(".dropzone").style.border="2px dashed #71bdff";
                     });
                    document.querySelector(".start").onclick = function() {
                
                        mydrop.processQueue()
                      };
    
            }
        };

    </script>

</asp:Content>
