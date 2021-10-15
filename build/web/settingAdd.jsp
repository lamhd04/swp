<%-- 
    Document   : settingAdd
    Created on : Sep 30, 2021, 9:25:13 PM
    Author     : Nhat Anh PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <h4>Add new</h4>
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <form method="post" action="SettingControl?op=add">
                                        <div class="form-group row">
                                            <label class="col-4 col-form-label">Type</label> 
                                            <div class="col-8">
                                                <input placeholder="Type" class="form-control here" type="text" name="stype">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-4 col-form-label">Value</label> 
                                            <div class="col-8">
                                                <input placeholder="Value" class="form-control here" type="text" name="value">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-4 col-form-label">Order</label> 
                                            <div class="col-8">
                                                <input placeholder="Order" class="form-control here" type="text" name="order">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-4 col-form-label">Status</label> 
                                            <div class="col-8">
                                                <input placeholder="Status" class="form-control here" type="text" name="status">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="offset-4 col-8">

                                                <input class="btn btn-primary" type="submit" value="Add" />
                                                <input class="btn btn-primary" type="reset" value="Clear" />
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
