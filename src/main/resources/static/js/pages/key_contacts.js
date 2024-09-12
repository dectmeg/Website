$(document).ready(function() {

    function obfuscateEmail(email) {
        return email.replace(/@/g, '[at]').replace(/\./g, '[dot]');
    }

    function populateContactsTable(contactsList) {
        var tableBody = $('#contactsTableBody');
        tableBody.empty(); // Clear existing rows

        $.each(contactsList, function(index, contact) {
            var obfuscatedEmail = obfuscateEmail(contact.email);
            var row = '<tr>' +
                '<td>' + (index + 1) + '</td>' +
                '<td>' + contact.nameAndDesignation + '</td>' +
                '<td>' + contact.officeNumber + '</td>' +
                '<td>' + contact.mobileNumber + '</td>' +
                '<td>' + obfuscatedEmail + '</td>' +
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
