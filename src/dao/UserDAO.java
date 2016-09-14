package dao;

import model.User;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Steve on 02-Sep-16.
 */
public class UserDAO {

    private Connection con;

    public UserDAO(){
        con = DBUtil.getConnection();
    }

    /*
    Adds a new user to the database
     */
    public int addUser(User user){
        int result1=0;
        int result2=0;

        try{
            int last_inserted_id = 0;

            String addressQuery = "insert into address (workAddress, homeAddress) values (?,?);";
            PreparedStatement preparedStatement1 = con.prepareStatement(addressQuery, Statement.RETURN_GENERATED_KEYS);
            preparedStatement1.setString(1, user.getWorkAddress());
            preparedStatement1.setString(2, user.getHomeAddress());
            result1 = preparedStatement1.executeUpdate();
            // we get the id of the last inserted row
            ResultSet rs = preparedStatement1.getGeneratedKeys();
            if (rs.next()){
                last_inserted_id = rs.getInt(1);
            }
            preparedStatement1.close();

            String query = "insert into users (userName, lastName, gender, dob, address) values (?,?,?,?,?);";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getGender());
            preparedStatement.setDate(4, new java.sql.Date(user.getDob().getTime())); // convert util.date to sql.date
            preparedStatement.setInt(5, last_inserted_id);
            result2 = preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (result1 !=0 && result2 !=0)
            return 1;
        else
            return 0;
    }

    /*
    updates user with new data
     */
    public int updateUser(User user){
        int result1=0;
        int result2=0;

        // get addressId from user table
        int addressId = 0;
        try{
            PreparedStatement ps = con.prepareStatement("select address " +
                    "from users join address on users.address = address.addressId " +
                    "where userId = ?");
            ps.setInt(1, user.getUserId());
            ResultSet rs = ps.executeQuery();
            rs.next();
            addressId = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // update address table
        String addressQuery = "update address set workAddress=?, homeAddress=? where addressId=?";
        try{
            PreparedStatement ps = con.prepareStatement(addressQuery);
            ps.setString(1, user.getWorkAddress());
            ps.setString(2, user.getHomeAddress());
            ps.setInt(3, addressId);
            result1 = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // update user table
        String query = "update users set userName = ?, lastName = ?, gender = ?, dob = ? " +
                "where userId = ? ";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getGender());
            preparedStatement.setDate(4, new java.sql.Date(user.getDob().getTime()));
            preparedStatement.setInt(5, user.getUserId());
            result2 = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //if user has been updated successfully return 1
        if (result1 !=0 && result2 !=0)
            return 1;
        else
            return 0;
    }

    /*
    Retrieves all users from the database
     */
    public List<User> getAllUsers() {
        List<User> Users = new ArrayList<>();
        try {
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery( "select * from users" );

            while( resultSet.next() ) {
                User User = new User();
                User.setUserId( resultSet.getInt( "userId" ) );
                User.setUserName( resultSet.getString( "userName" ) );
                User.setLastName( resultSet.getString( "lastName" ) );
                User.setGender( resultSet.getString( "gender" ) );
                User.setDob( resultSet.getDate( "dob" ) );
                Users.add(User);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Users;
    }

    public int getNumberOfEnrties(){
        int number_of_entries = 0;
        try {
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery( "select count(*) from users" );

            while( resultSet.next() ) {
                number_of_entries = resultSet.getInt(1);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return number_of_entries;
    }

    /*
    Returns user specified by id
     */
    public User getUserById(int UserId) {
        User user = new User();
        try {
            String query =  "select userId, userName, lastName, gender, dob, workAddress, homeAddress " +
                            "from users join address on users.address = address.addressId " +
                            "where userId=?;";
            PreparedStatement preparedStatement = con.prepareStatement( query );
            preparedStatement.setInt(1, UserId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while( resultSet.next() ) {
                user.setUserId( resultSet.getInt( "userId" ) );
                user.setUserName( resultSet.getString( "userName" ) );
                user.setLastName( resultSet.getString( "LastName" ) );
                user.setGender( resultSet.getString( "gender" ) );
                user.setDob( resultSet.getDate( "dob" ) );
                user.setWorkAddress(resultSet.getString("workAddress"));
                user.setHomeAddress(resultSet.getString("homeAddress"));
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
