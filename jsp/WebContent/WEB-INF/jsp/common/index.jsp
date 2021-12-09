<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<jsp:include page="head.jsp" />
</head>
<body>
	<jsp:include page="header.jsp" />
	<main class="index">
	<div class="slider">
		<input type="radio" name="slide" id="slide1" checked> 
		<input type="radio" name="slide" id="slide2"> 
		<input type="radio" name="slide" id="slide3"> 
		<input type="radio" name="slide" id="slide4">
		<ul id="imgholder" class="imgs">
			<li><img src="${pageContext.request.contextPath}/images/index3.png" class="d-block w-100" alt="3"></li>
			<li><img src="${pageContext.request.contextPath}/images/index1.png" class="d-block w-100" alt="2"></li>
			<li><img src="${pageContext.request.contextPath}/images/index4.png" class="d-block w-100" alt="4"></li>
			<li><img src="${pageContext.request.contextPath}/images/index2.png" class="d-block w-100" alt="1"></li>
		</ul>
		<p class="bullet">
			<label for="slide1"></label>
			<label for="slide2"></label>
			<label for="slide3"></label>
			<label for="slide4"></label>
		</p>
	</div>
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">museum of arts</h2>
                <!-- Portfolio Grid Items-->
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <div>
	                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/img1.png" alt="..." />
                            </div>
                        </div>
                    </div>
                    <!-- Portfolio Item 2-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal2">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <div>
	                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/img2.png" alt="..." />
                            </div>
                        </div>
                    </div>
                    <!-- Portfolio Item 3-->
                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal3">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <div>
	                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/img3.png" alt="..." />
                            </div>
                        </div>
                    </div>
                    <!-- Portfolio Item 4-->
                    <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal4">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <div>
	                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/img4.png" alt="..." />
                            </div>
                        </div>
                    </div>
                    <!-- Portfolio Item 5-->
                    <div class="col-md-6 col-lg-4 mb-5 mb-md-0">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal5">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <div>
	                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/img5.png" alt="..." />
                            </div>
                        </div>
                    </div>
                    <!-- Portfolio Item 6-->
                    <div class="col-md-6 col-lg-4">
                        <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal6">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <div>
	                            <img class="img-fluid" src="${pageContext.request.contextPath}/images/img6.png" alt="..." />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
                <!-- Portfolio Modal 1-->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Passion</h2>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mt-5 mb-5" src="${pageContext.request.contextPath}/images/img1.png" alt="..." />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-4">Surround yourself with the dreamers and the doers, the believers and thinkers, but most of all, surround yourself with those who see greatness within you, even when you don't see it yourself.</p>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 2-->
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Hope</h2>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mt-5 mb-5" src="${pageContext.request.contextPath}/images/img2.png" alt="..." />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-4">Life is like a piano. The white keys represent happiness and the black show sadness.But as you go through life's journey, remember that the black keys also make music.</p>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 3-->
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Pleasure</h2>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mt-5 mb-5" src="${pageContext.request.contextPath}/images/img3.png" alt="..." />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-4">I believe the nicest and sweertest days are not those on which anything very splendid or worderful or exciting happens but just those that bring simple little pleasures, following one another softly, like pearls slipping off a string.</p>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 4-->
        <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" aria-labelledby="portfolioModal4" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Glittering</h2>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mt-5 mb-5" src="${pageContext.request.contextPath}/images/img4.png" alt="..." />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-4">Oh, it's delightful to have ambitions. I'm so glad I have such a lot. And there never seems to be any end to them that's the best of it. Just as soon as you attain to one ambition you see another one glittering higher up still. I does make life so interesting.</p>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 5-->
        <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" aria-labelledby="portfolioModal5" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Sunshine</h2>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mt-5 mb-5" src="${pageContext.request.contextPath}/images/img5.png" alt="..." />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-4">Do not sopil what you have by desiring what you have not; remember that what you now have was once among the things you only hoped for.</p>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio Modal 6-->
        <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" aria-labelledby="portfolioModal6" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-0"><button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button></div>
                    <div class="modal-body text-center pb-5">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <!-- Portfolio Modal - Title-->
                                    <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Wind</h2>
                                    <!-- Portfolio Modal - Image-->
                                    <img class="img-fluid rounded mt-5 mb-5" src="${pageContext.request.contextPath}/images/img6.png" alt="..." />
                                    <!-- Portfolio Modal - Text-->
                                    <p class="mb-4">I have learnd that there is more power in a good strong bug than in a thousand meaningful words.</p>
                                    <button class="btn btn-primary" data-bs-dismiss="modal">
                                        <i class="fas fa-times fa-fw"></i>
                                        Close Window
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	</main>
	<jsp:include page="footer.jsp" />
</body>
</html>