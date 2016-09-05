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

import static java.lang.System.out;

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

            RequestDispatcher view = req.getRequestDispatcher("/userDetails.jsp");
            view.forward(req, resp);
        } else if (action.equalsIgnoreCase("list")){
            List<User> users = userDAO.getAllUsers();
            req.setAttribute("users", users);

            RequestDispatcher view = req.getRequestDispatcher("/displayUsers.jsp");
            view.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action.equalsIgnoreCase("insert")) {
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

            if (userDAO.addUser(user) !=0)
                req.setAttribute("insertStatus", "success");
            else
                req.setAttribute("insertStatus", "fail");

            RequestDispatcher view = req.getRequestDispatcher("/index.jsp");
            view.forward(req, resp);
        }
    }
}
