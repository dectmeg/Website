package com.dect.website.controller;


import com.dect.website.entity.primary.KeyContacts;
import com.dect.website.service.KeyContactsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class KeyContactsController {

    @Autowired
    private KeyContactsService keyContactService;

    @PostMapping("/secure/key-contacts/add")
    public ResponseEntity<String> addKeyContact(@RequestBody KeyContacts keyContacts) {

        keyContactService.saveKeyContacts(keyContacts);

        return ResponseEntity.ok("Key contact added successfully");
    }


    @GetMapping("key-contacts/all")
    public ResponseEntity<Iterable<KeyContacts>> getAllKeyContacts() {
        Iterable<KeyContacts> keyContacts = keyContactService.getAllKeyContacts();
        System.out.println(keyContacts);
        return new ResponseEntity<>(keyContacts, HttpStatus.OK);
    }

    @PostMapping("/key-contacts/delete/{id}")
    public ResponseEntity<String> deleteKeyContact(@PathVariable("id") Long id) {
        keyContactService.deleteKeyContact(id);
        return ResponseEntity.ok("Contact deleted successfully");
    }
}
