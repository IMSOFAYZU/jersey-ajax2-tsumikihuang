/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lendle.courses.imsofa.jerseyajax2;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author lendle
 */
@Path("user")
public class UserResource {
    //加上 @Path 等等 annotation, 讓它回傳某個特定 user
    @Path("/{id}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public User getUser(@PathParam("id") String id){
        return UserDB.getUser(id);
    }
    ///////////////////////////////////////////////
    
    //加上 @PUT 等等 annotation，實作 edit
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public int updateUser(User user){
        UserDB.deleteUser((user));
        UserDB.addUser((user));
        return 1;
    }
    //////////////////////////////////////
    
    //加上 @POST 等等 annotation，實作 add
    public int addUser(User user){
        return 1;
    }
    ///////////////////////////////////
    
    //加上 @DELETE 等等 annotation，實作 delete
    public int deleteUser(String id){
        return 0;
    }
    /////////////////////////////////////////
}
