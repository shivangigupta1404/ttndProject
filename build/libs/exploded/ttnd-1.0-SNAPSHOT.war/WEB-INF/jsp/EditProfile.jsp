<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <jsp:include page="loggedInNavbar.jsp" />
    <div class="text-center error font-md">${error}</div>
    <div class="text-center success font-md">${success}</div>
    <div class="container-fluid" id="main-body">
        <div class="row">
            <div class="col-xs-12 col-sm-offset-1 col-sm-4 font-md">
                <div class="panel panel-default border-black-1">
                    <div class="panel-body">
                        <div class="container-fluid">
                            <div class="col-xs-3 col-sm-3 about">
                                    <img src="${pageContext.request.contextPath}/images/${user.id}" alt="user" class="img-responsive center-block">
                            </div>
                            <div class="col-xs-9 col-sm-9">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <strong>${user.firstname} ${user.lastname}</strong>
                                    </div>
                                    <p class="grey">@${user.username}</p>
                                    <div class="col-xs-8">
                                        <div>Subscriptions</div>
                                        <div>${user.subscriptionCount}</div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div>Topics</div>
                                        <div>${user.topicCount}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6">Your Topics</div>
                            </div>
                        </div>

                    </div>
                    <div class="panel-body">
                        <div class="container-fluid">
                            <c:forEach var="topic" items="${topicList}">
                                <div class="row">
                                    <div class="col-xs-3 col-sm-3">
                                        <img src="${pageContext.request.contextPath}/images/${topic.createdBy.id}" alt="user" class="img-responsive center-block">
                                    </div>
                                    <div class="col-xs-9 col-sm-9">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12">
                                                <div class="row">
                                                    <form action="/changetopicname/${topic.id}">
                                                        <div class="form-group col-xs-6">
                                                            <input type="text" class="form-control" name="email" value="${topic.name}">
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <button type="submit" class="btn btn-default">Save</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="font-sm">
                                                <div class="col-xs-4 col-sm-4">
                                                    <p class="grey"><c:out value="${topic.createdBy.name}"/></p>
                                                </div>
                                                <div class="col-xs-4 col-sm-4">
                                                    <div>Subscriptions</div>
                                                    <div><c:out value="${topic.subscriptionCount}"/></div>
                                                </div>
                                                <div class="col-xs-4 col-sm-4">
                                                    <div>Posts</div>
                                                    <div><c:out value="${topic.postCount}"/></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row option-list text-center">
                                    <div>
                                        <select>
                                            <option value="${topic.seriousness}"><c:out value="${topic.seriousness}"/></option>
                                            <option value="Very Serious">Very Serious</option>
                                            <option value="Casual">Casual</option>
                                            <option value="Serious">Serious</option>
                                        </select>
                                        <select>
                                            <option value="${topic.visibility}"><c:out value="${topic.visibility}"/></option>
                                            <option value="Private">Private</option>
                                            <option value="Public">Public</option>
                                        </select>
                                        <span class="option">
                                        <span  class="glyphicon glyphicon-trash"></span>
                                    </span>

                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 font-md">
                <div class="panel panel-default">
                    <div class="panel-heading font-md">Profile</div>
                    <div class="panel-body">
                        <div class="container-fluid">
                            <form class="form-horizontal" id="edit_profile_form" action="/edituserinfo" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <div class="row">
                                        <label class="control-label col-xs-12 col-sm-3" for="edit_profile_firstname">First Name * :</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <input type="text" class="form-control" id="edit_profile_firstname" name="firstname" value="<%=session.getAttribute("firstname")%>  ">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="control-label col-xs-12 col-sm-3" for="edit_profile_lastname">Last Name * :</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <input type="text" class="form-control" id="edit_profile_lastname" name="lastname" value="<%=session.getAttribute("lastname")%>  ">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="control-label col-xs-12 col-sm-3" for="edit_profile_username">Username * :</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <input type="text" class="form-control" id="edit_profile_username" name="username" value="<%=session.getAttribute("username")%>  ">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="row">
                                        <label class="control-label col-xs-12 col-sm-3" for="edit_profile_photo">Photo</label>
                                        <div class="col-xs-6 col-xs-offset-3 col-sm-offset-0 col-sm-8">
                                            <input type="file" id="edit_profile_photo" name="photo" style="display: none;"/>
                                            <input type="button" value="Upload image" class="btn btn-default" onclick="document.getElementById('edit_profile_photo').click();" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-xs-4 col-xs-offset-3 col-sm-5">
                                            <button type="submit" class="btn btn-default">Update</button>
                                        </div>
                                        <span class="col-xs-12 col-sm-offset-3 col-sm-9" id='edit_profile_validity'></span>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading font-md">Change Password</div>
                    <div class="panel-body">
                        <div class="container-fluid">
                            <form class="form-horizontal" id="edit_password" action="/changepassword" method="POST" enctype="multipart/form-data">
                                <div class="form-group">
                                    <div class="row">
                                        <label class="control-label col-xs-12 col-sm-3" for="edit_password_password">Password * :</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <input type="password" class="form-control" id="edit_password_password" name="password" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="control-label col-xs-12 col-sm-3" for="edit_password_confirm">Confirm Password * :</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <input type="password" class="form-control" id="edit_password_confirm" name="confirmPassword" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-xs-4 col-xs-offset-3 col-sm-5">
                                            <button type="submit" class="btn btn-default">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>
