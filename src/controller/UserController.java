package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * Created by Steve on 02-Sep-16.
 */
public class UserController extends HttpServlet {

    private UserDAO userDAO;

    public UserController(){
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action.equalsIgnoreCase("view")) {
            int user_id = Integer.parseInt(req.getParameter("id"));
            User user = userDAO.getUserById(user_id);
            req.setAttribute("user", user);
            req.setAttribute("action", "view"); // flag to open user details page in view mode

            RequestDispatcher view = req.getRequestDispatcher("/user.jsp");
            view.forward(req, resp);
        } else if (action.equalsIgnoreCase("list")){
            loadAllUsers(req, resp, null);
        } else if (action.equalsIgnoreCase("edit")){
            int user_id = Integer.parseInt(req.getParameter("id"));
            User user = userDAO.getUserById(user_id);
            req.setAttribute("user", user);
            req.setAttribute("action", "edit"); // flag to open user details page in edit mode

            RequestDispatcher view = req.getRequestDispatcher("/user.jsp");
            view.forward(req, resp);
        } else if (action.equalsIgnoreCase("delete")){
            int user_id = Integer.parseInt(req.getParameter("id"));
            if (userDAO.deleteUser(user_id) !=0 ){
                //success
                loadAllUsers(req, resp, "User has been deleted successfully.");
            } else {
                //fail
                loadAllUsers(req, resp, "Failed to delete user.");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        User user = new User();
        user.setUserName(req.getParameter("userName"));
        user.setLastName(req.getParameter("lastName"));
        user.setGender(req.getParameter("gender"));
        String dobStr = req.getParameter("dob");
        // convert date string to Date
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date dob = sdf.parse(dobStr);
            user.setDob(dob);
        } catch (ParseException pe) {
            pe.printStackTrace();
        }
        user.setWorkAddress(req.getParameter("workAddress"));
        user.setHomeAddress(req.getParameter("homeAddress"));

        if (action.equalsIgnoreCase("insert")){
            if (userDAO.addUser(user) !=0)
                req.setAttribute("message", "A new user has been added!");
            else
                req.setAttribute("message", "Failed to add new user.");

            RequestDispatcher view = req.getRequestDispatcher("/index.jsp");
            view.forward(req, resp);

        } else if (action.equalsIgnoreCase("edit")){
            String user_id = req.getParameter("user_id");
            user.setUserId(Integer.parseInt(user_id));

            if (userDAO.updateUser(user) !=0)
                loadAllUsers(req, resp, "User has been updated successfully!");
            else
                loadAllUsers(req, resp, "Failed to update user.");
        }
    }

    private void loadAllUsers(HttpServletRequest req, HttpServletResponse resp, String message){
        List<User> users = userDAO.getAllUsers();
        req.setAttribute("users", users);
        req.setAttribute("numOfEntries", userDAO.getNumberOfEnrties());
        req.setAttribute("message", message);

        RequestDispatcher view = req.getRequestDispatcher("/userlist.jsp");
        try {
            view.forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
