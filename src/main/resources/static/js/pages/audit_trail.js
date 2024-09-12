$(document).ready(function() {

    var auditTable = $('#auditTrailTable').DataTable({
        "processing": true,
        "serverSide": false,
        "ajax": {
            "url": "/secure/audit-trail/all",
            "dataSrc": ""
        },
        "columns": [
            { "data": null, "render": function(data, type, row, meta) {
                return meta.row + 1;
            }},
            { "data": "userName" },
            { "data": "requestedOn", "render": function(data) {
                return new Date(data).toLocaleString();
            }},
            { "data": "ipAddress" },
            { "data": "responseStatus" },
            { "data": "url" }
        ]
    });

});
