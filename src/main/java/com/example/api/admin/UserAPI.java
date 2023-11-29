package com.example.api.admin;

import com.example.dto.ProductDTO;
import com.example.dto.UserDTO;
import com.example.service.IProductService;
import com.example.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController(value = "userApiOfAdmin")
@RequestMapping(value = "/api/admin/user")
public class UserAPI {

    @Autowired
    private IUserService userService;

    @PostMapping
    public ResponseEntity<UserDTO> createUser(@RequestBody UserDTO userDTO) {
        return ResponseEntity.ok(userService.insert(userDTO));
    }

    @PutMapping
    public ResponseEntity<UserDTO> updateUser(@RequestBody UserDTO userDTO) {
        return ResponseEntity.ok(userService.update(userDTO));
    }

    @DeleteMapping
    public ResponseEntity<String> deleteProduct(@RequestBody long[] ids) {
        if (ids.length > 0) {
            userService.deleteUser(ids);
        }
        return ResponseEntity.ok("success");
    }
}
