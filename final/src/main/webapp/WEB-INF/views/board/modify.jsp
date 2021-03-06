<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../includes/head.jsp" />
<sec:csrfMetaTags />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.10.1/ckeditor.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor/4.10.1/config.js"></script>
</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->


    <!--**********************************
        Main wrapper start
    ***********************************-->
       <div id="main-wrapper">
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <jsp:include page="../includes/header.jsp" />
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
                <!-- row -->
                <div class="row content-body">
                    <div class="col-lg-6" style="float: none; margin: 0 auto">
                        <div class="card pr-3">
                            <div class="card-body">
                                </div>
                                <div class="email-right-box ml-0 ml-sm-4 ml-sm-0">
                                    <div class="compose-content">
		                            	<form method="post">
			                            	 <div class="form-group">
			                                 	<label for="bno" class="text-dark font-weight-bold">Bno</label>
			                                  	<input class="form-control" id="bno" name="bno" readonly value="${board.bno}">
			                               	</div>
											<div class="form-group">
												<label for="title" class="text-dark font-weight-bold">Title</label>
												<input class="form-control" id="title" name="title"  value="${board.title}">
											</div>
										  	 <div class="form-group">
			                                    <label for="content" class="text-dark font-weight-bold">Content</label>
			                                    <textarea class="form-control h-25" rows="10" id="content1" name="content"></textarea>
			                               </div>
			                               
			                               
			                               <div class="form-group">
			                                  <label for="writer" class="text-dark font-weight-bold">Writer</label>
			                                   <sec:authentication property="principal.username" var="userId"/>
			                                  <input class="form-control" id="writer" name="writer" value="${board.writer}" >
			                                  
			                               </div>
			                               <input type="hidden" name="pageNum" value="${cri.pageNum}">
			                               <input type="hidden" name="amount" value="${cri.amount}">
			                               <input type="hidden" name="type" value="${cri.type}">
			                               <input type="hidden" name="keyword" value="${cri.keyword}">
			                             <sec:authentication property="principal" var="pinfo"/>
			                               <sec:authorize access="isAuthenticated()">
			                               <c:if test="${pinfo.username == board.writer}">
			                               <sec:csrfInput/>
			                               <button class="btn btn-warning" formaction="modify" id="btnSubmit">Modify</button>   
			                               <button class="btn btn-danger" formaction="remove">Remove</button>   
			                               </c:if>
			                               </sec:authorize>  
			                               
                               
					                               <a class="btn btn-primary" href="list">List</a>   
					                             </form>
					                        </div>
					                    </div>
					                    <p></p>
                                     <div class="card shadow mb-4">
			                        <div class="card-header py-3">
			                            <h6 class="m-0 font-weight-bold text-primary">File Attach</h6>
			                        </div>
			                        <div class="card-body">
			                           <div class="form-group uploadDiv">
			                               <label for="files" class="btn btn-primary px-4"><i class="far fa-file mr-2"></i> File</label>
			                               <input type="file" class="form-control d-none" id="files" name="files" multiple>
			                            </div>
                           <div class="uploadResult">
                        <ul class="list-group">
                        </ul>
                     </div>
                     </div>
                    </div>
               </div>
                <!-- /.container-fluid -->

            </div>
         </div>
         </div>
            <!-- End of Main Content -->
<script>
/* 		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");
		
		$(document).ajaxSend(function(e, xhr) {
		xhr.setRequestHeader(csrfHeader, csrfToken);
		}) */
		
   	 function showImage(fileCallPath) {
   		
   		 $("#pictureModal")
   		 	.find("img").attr("src", "/display?fileName="+fileCallPath)
   		 .end().modal("show");
   	 }
      $(function() {
    	  var csrfHeader=$("meta[name='_csrf_header']").attr("content");
	       var csrfToken=$("meta[name='_csrf']").attr("content");
	       
	       $(document).ajaxSend(function (e,xhr) {
	         xhr.setRequestHeader(csrfHeader,csrfToken);
	      })
    	  var bno = '${board.bno}';
         var cloneObj = $(".uploadDiv").clone();
         
         
         var regex = /(.*?)\.(exe|sh|zip|alz)$/;
         var maxSize = 1024 * 1024 * 5;

         function checkExtension(fileName, fileSize) {
            if(fileSize >= maxSize) {
               alert("?????? ????????? ??????");
               return false;
            }
            if(regex.test(fileName)) {
               alert("?????? ????????? ????????? ????????? ??? ??? ????????????.");
               return false;
            }
            return true;
         }
         
         function showUploadedFile(resultArr) {
            var str = "";
            for(var i in resultArr) {
               str += "<li class='list-group-item' "
               str +="data-uuid='" + resultArr[i].uuid + "' ";
               str +="data-path='" + resultArr[i].path + "' ";
               str +="data-origin='" + resultArr[i].origin + "' "; 
               str +="data-size='" + resultArr[i].size + "' "
               str +="data-image='" + resultArr[i].image + "' "
               str +="data-mime='" + resultArr[i].mime + "' "
               str +="data-ext='" + resultArr[i].ext + "' "
               str +=">"
               if(resultArr[i].image) {
            	  str += "<a href='javascript:showImage(\"" + resultArr[i].fullPath + "\")'>"
                  str += "<img src='/display?fileName=" +  resultArr[i].thumb  + "'>";
                  str +="</a>"
               } else {
               str += "<a href='/download?fileName=" + resultArr[i].fullPath + "'>";
               str += "<i class='fas fa-paperclip'></i> " + resultArr[i].origin + "</a>"
                  
               }
               str += "  <small><i data-file='"+ resultArr[i].fullPath + "'data-image='" +  resultArr[i].image + "'";
               str += "class='fas fa-trash-alt text-danger'></i></small></li>";
            }
            $(".uploadResult ul").append(str);
         }

         $(".uploadDiv").on("change","#files",function() {
            var files = $("#files")[0].files;
            console.log(files);

            var formData = new FormData();
            for(var i in files) {
                  if(!checkExtension(files[i].name, files[i].size)){
                     return false;
                  }
               formData.append("files", files[i]);
            }

            $.ajax("/upload", {
               processData:false,
               contentType:false,
               data:formData,
               dataType : 'json',
               type:"POST",
               success:function(result) {
                  console.log(result);   
                  $(".uploadDiv").html(cloneObj.html());
                  showUploadedFile(result);
               }
               
            })   
         });
         
         $(".uploadResult").on("click", "small i", function() {
        	 var $li = $(this).closest("li");
        	 if(confirm("Remove this file?")) {
        		 $li.remove();
        	 }
        		 $.ajax("/deleteFile", {
	        		type : "post",
	        		data : {fileName:$(this).data("file"), image:$(this).data("image")},
	        		success : function(result) {
								$li.remove();
	        		}
	        	})  
	         });
         
         // ??? ?????? ?????????
         $("#btnSubmit").click(function() {
        	 event.preventDefault();
        	 
       	 var str = "";
        	 var datas= ["uuid", "path", "origin", "ext", "mime", "size", "image"];
        	 $(".uploadResult li").each(function(i) {
        		 for(var j in datas)
        		 str += "<input type='hidden' name='attachs["+i+"]." + datas[j] + "' value='" +$(this).data(datas[j])+ "'>";
        	});
        	  $(this).closest("form").append(str).submit(); 
        	 //console.log($(this).closest("form").append(str).html());
         })
            CKEDITOR.replace("content1", {
        	      toolbar: [{
        	          name: 'document',
        	          items: ['Print']
        	        },
        	        {
        	          name: 'clipboard',
        	          items: ['Undo', 'Redo']
        	        },
        	        {
        	          name: 'styles',
        	          items: ['Format', 'Font', 'FontSize']
        	        },
        	        {
        	          name: 'colors',
        	          items: ['TextColor', 'BGColor']
        	        },
        	        {
        	          name: 'align',
        	          items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
        	        },
        	        '/',
        	        {
        	          name: 'basicstyles',
        	          items: ['Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat', 'CopyFormatting']
        	        },
        	        {
        	          name: 'links',
        	          items: ['Link', 'Unlink']
        	        },
        	        {
        	          name: 'paragraph',
        	          items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote']
        	        },
        	        {
        	          name: 'insert',
        	          items: ['Image', 'Table']
        	        },
        	        {
        	          name: 'tools',
        	          items: ['Maximize']
        	        },
        	        {
        	          name: 'editing',
        	          items: ['Scayt']
        	        }
        	      ],

        	      extraAllowedContent: 'h3{clear};h2{line-height};h2 h3{margin-left,margin-top}',

        	      // Adding drag and drop image upload.
        	      extraPlugins: 'print,format,font,colorbutton,justify,uploadimage', 
        	      uploadUrl: '/ckupload.json?${_csrf.parameterName}=${_csrf.token}&command=file&type=File&responseType=json',
        	    		  
		          filebrowserImageUploadUrl: '/ckupload.json?${_csrf.parameterName}=${_csrf.token}&command=QuickUpload&type=Images',
		       /*      filebrowserUploadMethod : "form" */

        	      // Configure your file manager integration. This example uses CKFinder 3 for PHP.
        	   /*    filebrowserBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html',
        	      filebrowserImageBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html?type=Images',
        	      filebrowserUploadUrl: '/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Files',
        	      filebrowserImageUploadUrl: '/apps/ckfinder/3.4.5/core/connector/php/connector.php?command=QuickUpload&type=Images', */

        	      height: 560,

        	      removeDialogTabs: 'image:advanced;link:advanced',
        	      removeButtons: 'PasteFromWord'
        
        	/* filebrowserUploadUrl : "",
        	filebrowserImageUploadUrl : "", */
     /*    	filebrowserBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html',
            filebrowserImageBrowseUrl: '/apps/ckfinder/3.4.5/ckfinder.html?type=Images', */
        });
             // ???????????? ????????????
        $.getJSON("/board/getAttachs/"+bno).done(function(data) {
        	console.log(data);
        	showUploadedFile(data);
        })
	  })

   </script>
                                  
                            
  
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
<jsp:include page="../includes/footer.jsp"/>
        <!--**********************************
            Footer end
        ***********************************-->

        <!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->

        
    
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
<jsp:include page="../includes/foot.jsp" />



</body>

</html>