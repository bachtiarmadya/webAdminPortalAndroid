<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.mdl_absensi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" language="JavaScript">
    function konfirmasi()
    {
        tanya = confirm("Anda Yakin Akan Menghapus Data ?");
        if (tanya == true)
            return true;
        else
            return false;
    }

//filter broh
    (function (document) {
        'use strict';

        var LightTableFilter = (function (Arr) {

            var _input;

            function _onInputEvent(e) {
                _input = e.target;
                var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                Arr.forEach.call(tables, function (table) {
                    Arr.forEach.call(table.tBodies, function (tbody) {
                        Arr.forEach.call(tbody.rows, _filter);
                    });
                });
            }

            function _filter(row) {
                var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
                row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
            }

            return {
                init: function () {
                    var inputs = document.getElementsByClassName('light-table-filter');
                    Arr.forEach.call(inputs, function (input) {
                        input.oninput = _onInputEvent;
                    });
                }
            };
        })(Array.prototype);

        document.addEventListener('readystatechange', function () {
            if (document.readyState === 'complete') {
                LightTableFilter.init();
            }
        });

    })(document);
</script>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>IDOCEMENT</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="viewport" content="width=device-width">        
        <link rel="stylesheet" href="css/templatemo_main.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
        Object name = request.getSession().getAttribute("name");
        if ((session.getAttribute("name") == null) || (session.getAttribute("name") == "")) {
            response.sendRedirect("login.jsp");
        }
    %>
    <body onLoad="buildHtmlTable('#excelDataTable')">
        <div id="main-wrapper">
            <div class="navbar navbar-inverse" role="navigation">
                <div class="navbar-header">
                    <div class="logo"><h1>Selamat Datang di Web Admin</h1></div>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button> 
                </div>   
            </div>
            <div class="template-page-wrapper">
                <div class="navbar-collapse collapse templatemo-sidebar">
                    <ul class="templatemo-sidebar-menu">
                        <li>
                            <form class="navbar-form">
                                <h5>Selamat Datang: <% out.print(name); %></h5>
                            </form>
                        </li>
                        <li><a href="index.jsp"><i class="fa fa-home"></i>Index</a></li>
                        <li class="sub">
                            <a href="javascript:;">
                                <i class="fa fa-users"></i> Keluhan <div class="pull-right"><span class="caret"></span></div>
                            </a>
                            <ul class="templatemo-submenu">
                                <li><a href="keluAbsensi.jsp">Keluhan Absensi</a></li>
                                <li><a href="keluhanCuti.jsp">Keluhan Cuti</a></li>
                                <li><a href="keluOver.jsp">Keluhan Overtime</a></li>
                            </ul>
                        </li>
                        <li class="sub">
                            <a href="javascript:;">
                                <i class="fa fa-users"></i> Pendaftaran <div class="pull-right"><span class="caret"></span></div>
                            </a>
                            <ul class="templatemo-submenu">
                                <li><a href="bpjs.jsp">Pendaftaran BPJS</a></li>
                                <li><a href="beasiswa.jsp">Pendaftaran Beasiswa</a></li>
                            </ul>
                        </li>
                        <li class="sub">
                            <a href="javascript:;">
                                <i class="fa fa-users"></i> Pengajuan <div class="pull-right"><span class="caret"></span></div>
                            </a>
                            <ul class="templatemo-submenu">
                                <li><a href="ubahIdCard.jsp">Perubahan Id Card</a></li>
                                <li><a href="SuKeterangan.jsp">Pengajuan Surat Keterangan</a></li>
                            </ul>
                        </li>
                        <li class="sub">
                            <a href="javascript:;">
                                <i class="fa fa-users"></i> Data Karyawan <div class="pull-right"><span class="caret"></span></div>
                            </a>
                            <ul class="templatemo-submenu">
                                <li><a href="User.jsp">Tabel Karyawan</a></li>
                                <li><a href="insert_user.jsp">Tambah Karyawan</a></li>
                            </ul>
                        </li>
                        <li class="sub">
                            <a href="javascript:;">
                                <i class="fa fa-users"></i> Feedback<div class="pull-right"><span class="caret"></span></div>
                            </a>
                            <ul class="templatemo-submenu">
                                <li><a href="feedback.jsp">Feedback</a></li>
                            </ul>
                        </li>
                        <li><a href="javascript:;" data-toggle="modal" data-target="#confirmModal"><i class="fa fa-sign-out"></i>Log Out</a></li>
                    </ul>
                </div><!--/.navbar-collapse -->
                <div class="templatemo-content-wrapper">
                    <div class="templatemo-content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="btn-group pull-right" id="templatemo_sort_btn">
                                    <form class="navbar-form" action="keluAbsensi.jsp">
                                        <input type="search" class="light-table-filter" data-table="order-table" placeholder="Filter">
                                    </form>
                                </div>
                                <div class="table-responsive">
                                    <h3 class="margin-bottom-15">Tabel Keluhan Absensi Karyawan</h3>
                                    <table id="myTable" class="order-table table table-striped table-hover table-bordered">
                                        <thead style="width:100%;text-align:left;background-color:gold;">
                                            <tr>
                                                <th>Keluhan</th>
                                                <th>Tanggal</th>
                                                <th>Status</th>
                                                <th>Nik</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                mdl_absensi km = new mdl_absensi();
                                                List<mdl_absensi> data = new ArrayList<mdl_absensi>();
                                                String ket = request.getParameter("ket");
                                                if (ket == null) {
                                                    data = km.tampil();
                                                }
                                                for (int x = 0; x < data.size(); x++) {
                                                    int id = data.get(x).getId();
                                            %>
                                            <tr>
                                                <td><%=data.get(x).getContent()%></td>
                                                <td><%=data.get(x).getDate()%></td>
                                                <td><%=data.get(x).getStatus()%></td>
                                                <td><%=data.get(x).getNik()%></td>
                                                <td>
                                        <center>
                                            <span class="btn btn-info"><a href="absensi?proses=view-absensi&id=<%=data.get(x).getId()%>">Lihat</a></span>
                                            <span class="btn btn-success"><a onclick="return konfirmasi()" href="absensi?proses=hapus-absensi&id=<%=data.get(x).getId()%>">Hapus</a></span>
                                        </center>
                                        </td>
                                        </tr>
                                        <%}%>
                                        </tbody>
                                    </table>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Apakah anda yakin untuk keluar?</h4>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="logout.jsp" class="btn btn-primary">Iya</a>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Tidak</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="templatemo-footer">
                    <div class="templatemo-copyright">
                        <p>Copyright &copy; 2018 PT Indocement Prakarsa Tunggal Tbk.</p>
                    </div>
                </footer>
                <script src="js/jquery.min.js"></script>
                <script src="js/bootstrap.min.js"></script>
                <script src="js/templatemo_script.js"></script>
                </body>
                </html>
