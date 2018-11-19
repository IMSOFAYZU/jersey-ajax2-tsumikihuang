<%-- 
    Document   : EDIT
    Created on : Oct 7, 2018, 9:09:52 PM
    Author     : lendle
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                //從 /webapi/user/{id} 讀入資料，填到指定欄位
                $.ajax("webapi/user/<%=request.getParameter("id")%>", {
                    type:"get",
                    success:function(d){
                        console.log(d);
                        $("#id").val(d.id);
                        $("#password").val(d.password);
                        $("#email").val(d.email);
                    }
                    
                });
                //////////////////////////////////////////
            });

            function save() {
                //用 put 呼叫 webapi/user
                //注意參數，要傳輸 json 格式字串
                $.ajax("webapi/user", {
                    type:"put",
                    data:JSON.stringify({
                        id:$("#id").val(),
                        password:$("#password").val(),
                        email:$("#email").val()
                    }),
                    contentType:"application/json".
                    sucess:function(data){
                        alert(data);
                    }
                });
                ////////////////////////////
            }
        </script>
    </head>
    <body>
        <div>
            ID: <input type="text" id="id" readonly="true"/><br/>
            Password: <input type="text" id="password"/><br/>
            Email: <input type="text" id="email"/><br/>
            <input type="button" onclick="save();" value="Save" />
        </div>
    </body>
</html>
