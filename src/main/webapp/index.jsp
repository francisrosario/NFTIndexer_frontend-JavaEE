<%@ page import="com.xwt.NFTIndexer.DAL" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css">
</head>

<body>
<div id="toolbar">
    <button id="button" class="btn btn-secondary">toggle Pagination</button>
</div>
<table id="table" data-toggle="table" data-toolbar="#toolbar" data-height="460" data-show-pagination-switch="true">
    <thead>
    <tr>
        <th>ID</th>
        <th>Classic Address</th>
        <th>IPFS Link</th>
    </tr>
    </thead>
    <tbody>
    <%
        DAL dal = new DAL();
        ResultSet rs = dal.getData();
        while(rs.next()){
            out.write("<tr>");
            try {
                out.write("<th>"+rs.getString(1)+"</th>");
                out.write("<th>"+rs.getString(2)+"</th>");
                out.write("<th><a href="+rs.getString(3)+" target=\"_blank\">"+rs.getString(3)+"</a></th>");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            out.write("</tr>");
        }
    %>
    </tbody>
</table>

<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
<script type="text/javascript">
    var $table = $('#table')
    var $button = $('#button')

    $(function() {
        $button.click(function () {
            $table.bootstrapTable('togglePagination')
        })
    })
</script>
</body>
</html>