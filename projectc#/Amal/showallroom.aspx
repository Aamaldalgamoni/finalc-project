<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showallroom.aspx.cs" Inherits="projectc_.Amal.showallroom" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.25/jspdf.plugin.autotable.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Show All Rooms</title>
    <style>
        body {
            background-color: #f0f2f5;
            padding-top: 30px;
            font-family: Arial, sans-serif;
        }
        
        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .table {
            width: 100%;
            table-layout: fixed;
            margin-top: 30px;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 15px;
            text-align: center;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table td {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
        }

        .table-striped tbody tr:nth-child(odd) {
            background-color: #f2f2f2;
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 36px;
            margin-bottom: 30px;
        }

        /* Responsive table */
        .table-responsive {
            overflow-x: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>All Room </h2>

            <table id="dataTable" class="table">
                <thead>
                    <tr>
                        <th scope="col">Room ID</th>
                        <th scope="col">Room Name</th>
                        <th scope="col">Room Capacity</th>
                        <th scope="col">Room Location</th>
                    </tr>
                </thead>

                <tbody id="tableBody" runat="server">
                </tbody>
            </table>
            <asp:Button ID="back2" runat="server" OnClick="back2_Click" Text="Go back"  CssClass="btn btn-primary"  />
            <button onclick="exportToPDF()" class="btn btn-danger">Export to PDF</button>
<button onclick="exportToExcel()" class="btn btn-success">Export to Excel</button>


        </div>
    </form>



  <script>
      function exportToPDF() {
          const { jsPDF } = window.jspdf;
          let doc = new jsPDF();

          doc.text("Room List", 14, 10);

          let table = document.getElementById("dataTable");
          let headers = [];
          let data = [];

          // استخراج رؤوس الأعمدة
          table.querySelectorAll("thead th").forEach(th => headers.push(th.innerText.trim()));

          // استخراج البيانات مع التأكد من تجاهل أي صف إضافي
          let rows = table.querySelectorAll("tbody tr");
          rows.forEach(tr => {
              let rowData = [];
              let isEmpty = true;

              tr.querySelectorAll("td").forEach(td => {
                  let text = td.innerText.trim();
                  rowData.push(text);
                  if (text !== "") {
                      isEmpty = false;
                  }
              });

              if (!isEmpty) { // فقط أضف الصف إذا لم يكن فارغاً
                  data.push(rowData);
              }
          });

          if (data.length === 0) {
              alert("No data available to export!");
              return;
          }

          doc.autoTable({
              head: [headers],
              body: data,
              startY: 20
          });

          doc.save("RoomList.pdf");
      }

      function exportToExcel() {
          let table = document.getElementById("dataTable");
          let headers = [];
          let data = [];

          // استخراج رؤوس الأعمدة
          table.querySelectorAll("thead th").forEach(th => headers.push(th.innerText.trim()));

          // استخراج البيانات مع التأكد من تجاهل أي صف إضافي
          let rows = table.querySelectorAll("tbody tr");
          rows.forEach(tr => {
              let rowData = [];
              let isEmpty = true;

              tr.querySelectorAll("td").forEach(td => {
                  let text = td.innerText.trim();
                  rowData.push(text);
                  if (text !== "") {
                      isEmpty = false;
                  }
              });

              if (!isEmpty) {
                  data.push(rowData);
              }
          });

          if (data.length === 0) {
              alert("No data available to export!");
              return;
          }

          let wb = XLSX.utils.book_new();
          let ws = XLSX.utils.aoa_to_sheet([headers, ...data]);

          XLSX.utils.book_append_sheet(wb, ws, "Rooms");
          XLSX.writeFile(wb, "RoomList.xlsx");
      }
        </script>


</body>
</html>

