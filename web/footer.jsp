<%-- 
    Document   : footer
    Created on : Nov 16, 2022, 4:16:29 PM
    Author     : Majid Paplu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">        
    </head>
    <body>

        <!-- Remove the container if you want to extend the Footer to full  width. -->
        <div class="mt-5">
            <footer class="text-white text-center text-lg-start" style="background-color: #23242a;">
                <!-- Grid container -->
                <div class="container p-4">
                    <!--Grid row-->
                    <div class="row mt-4">
                        <!--Grid column-->
                        <div class="col-lg-4 col-md-12 mb-4 mb-md-0">
                            <h5 class="text-uppercase mb-4">About Owner</h5>

                            <!--<img src="assets/images/owner_pic.jpg" style='border-radius: 250px;' height="250px" width="250px" >-->
                            <img src="assets/images/InShot_20210308_212718362.jpg" style='border-radius: 250px;' height="250px" width="250px" >
                            <!--<img src="assets/images/InShot_20210829_130925810.jpg" style='border-radius: 250px;' height="250px" width="250px" >-->

                            <div class="mt-4">
                                <!-- Facebook -->
                                <a href="https://www.facebook.com/profile.php?id=100017995480572" style="border-radius: 35px;" type="button" class="btn btn-floating btn-warning btn-lg"><i class="fa fa-facebook-f text-white"></i></a>
                                <!-- Insta-->
                                <a href="https://www.instagram/majidhussain318" style="border-radius: 35px;" type="button" class="btn btn-floating btn-warning btn-lg"><i class="fa fa-instagram text-white"></i></a>
                                <!-- Likedin -->
                                <a href="https://www.linkedin.com/in/majid-hussain-96715b1b8" style="border-radius: 35px;" type="button" class="btn btn-floating btn-warning btn-lg"><i class="fa fa-linkedin text-white"></i></a>
                                <!-- Google + -->
                                <a href="https://www.google.com" style="border-radius: 35px;" type="button" class="btn btn-floating btn-warning btn-lg"><i class="fa fa-google-plus text-white"></i></a>
                            </div>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase mb-4 pb-1">Search something</h5>

                            <div class="form-outline form-white mb-4">
                                <input type="text" id="formControlLg" class="form-control form-control-lg">
                                <label class="form-label" for="formControlLg" style="margin-left: 0px;">Search</label>
                                <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 48.8px;"></div><div class="form-notch-trailing"></div></div></div>

                            <ul class="fa-ul" style="margin-left: 1.65em;">
                                <li class="mb-3">
                                    <span class="fa-li"><i class="fa fa-home"></i></span><span class="ms-2">Qutria Street Mohula GareebAbad, 77300 Shahdadkot</span>
                                </li>
                                <li class="mb-3">
                                    <span class="fa-li"><i class="fa fa-google-plus"></i></span><span class="ms-2">majid.hussainqutriyo@gmail.com</span>
                                </li>
                                <li class="mb-3">
                                    <span class="fa-li"><i class="fa fa-phone"></i></span><span class="ms-2">+923313891044</span>
                                </li>
                                <li class="mb-3">
                                    <span class="fa-li"><i class="fa fa-phone"></i></span><span class="ms-2">+923313904631</span>
                                </li>
                            </ul>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
                            <h5 class="text-uppercase mb-4">Feedback</h5>
<!--                            <ul class="fa-ul" style="margin-left: 1.65em;">
                                <li class="mb-3">
                                    <span class="fa-li"><i class="fa fa-globe"></i></span><span class="ms-2">About Us</span>
                                </li>
                                <li class="mb-3">
                                    <span class="fa-li"><i class="fa fa-phone"></i></span><span class="ms-2">Contacts us</span>
                                </li>
                                <li class="mb-3">
                                    <span class="fa-li"><i class="fa fa-bitcoin"></i></span><span class="ms-2">blog</span>
                                </li>
                            </ul>-->

                            <form id="add-feedback-form" action="FeedbackServlet" method="post">
                                <div class='form-group mb-2'>
                                    <label>Name</label>
                                    <input required="" id="name" name="name" type="text" class="form-control" placeholder="Type your name">
                                </div>

                                <div class='form-group mb-2'>
                                    <label>Email</label>
                                    <input required="" id="email" name="email" type="email" class="form-control" placeholder="Type your email">
                                </div>

                                <div class="form-group">
                                    <label>Message</label>
                                    <textarea required="" id="feedback" name="feedback" rows='4' placeholder="Your thoughts is my pleasure.. freely gives us feedback!" class="form-control"></textarea>
                                </div>

                                <div class='btn-group text-center'>
                                    <button type="submit" class=' btn btn-outline-light mt-2'>Submit</button>
                                </div>
                            </form>
                        </div>
                        <!--Grid column-->
                    </div>
                    <!--Grid row-->
                </div>
                <!-- Grid container -->

                <!-- Copyright -->
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                    © 2022 Copyright:
                    <a class="text-white"">jobme.pk</a>
                </div>
                <!-- Copyright -->
            </footer>
        </div>
        <!-- End of .container -->
    </body>
</html>

<script>
    $(document).ready(function () {
        $('#add-feedback-form').on('submit', function (event) {
            event.preventDefault();

            let form = $(this).serialize();

            $.ajax({
                url: "FeedbackServlet",
                data: form,
                type: 'POST',
                success: function (data, textStatus, jqXHR) {
                    $('#name').val('');
                    $('#email').val('');
                    $('#feedback').val('');
                    swal({
                        title: "Good job!",
                        text: "Thanks for your feedback..!",
                        icon: "success",
                        button: "Well!",
                    });
                }, error: function (jqXHR, textStatus, errorThrown) {
                    swal({
                        title: "Sorry!",
                        text: "went wrong!",
                        icon: "error",
                        button: "Well!",
                    });
                }
            });
        });
    });
</script>
