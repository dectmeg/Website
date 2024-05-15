$(document).ready(function() {

    function populateContactsTable(contactsList) {
        var tableBody = $('#contactsTableBody');
        tableBody.empty(); // Clear existing rows

        $.each(contactsList, function(index, contacts) {
            var row = '<tr>' +
                '<td>' + (index + 1) + '</td>' +
                '<td>' + contacts.nameAndDesignation + '</td>' +
                '<td>' + contacts.officeNumber + '</td>' +
                '<td>' + contacts.mobileNumber + '</td>' +
                '<td>' + contacts.email + '</td>' +
            '</tr>';
            tableBody.append(row);
        });
    }

    function fetchContactsData() {
        $.ajax({
            url: '/key-contacts/all',
            method: 'GET',
            success: function(response) {
                populateContactsTable(response);
            },
            error: function() {
                console.error('Error fetching contacts.');
            }
        });
    }
    fetchContactsData();
});

