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
    Adds a new user to the database.
    Returns 1 if it was successful or 0 if it failed.
     */
    public int addUser(User user){
        int success=0;

        try{
            int last_inserted_id;
            // insert into users table
            String query = "insert into users (userName, lastName, gender, dob) values (?,?,?,?);";
            PreparedStatement preparedStatement = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getGender());
            preparedStatement.setDate(4, new java.sql.Date(user.getDob().getTime())); // convert util.date to sql.date
            preparedStatement.executeUpdate();

            // get the id of the last inserted row
            ResultSet rs = preparedStatement.getGeneratedKeys();
            if (rs.next()){
                last_inserted_id = rs.getInt(1);
                // insert into address table
                String addressQuery = "insert into address (userId, workAddress, homeAddress) values (?,?,?);";
                PreparedStatement preparedStatement2 = con.prepareStatement(addressQuery, Statement.RETURN_GENERATED_KEYS);
                preparedStatement2.setInt(1, last_inserted_id);
                preparedStatement2.setString(2, user.getWorkAddress());
                preparedStatement2.setString(3, user.getHomeAddress());
                success = preparedStatement2.executeUpdate();
                preparedStatement2.close();
            }
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    /*
    Updates user with new data.
    Returns 1 if it was successful or 0 if it failed.
     */
    public int updateUser(User user){
        int success = 0;

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
            if (preparedStatement.executeUpdate() !=0){
                // update address table
                String addressQuery = "update address set workAddress=?, homeAddress=? where userId=?";
                PreparedStatement ps = con.prepareStatement(addressQuery);

                ps.setString(1, user.getWorkAddress());
                ps.setString(2, user.getHomeAddress());
                ps.setInt(3, user.getUserId());
                success = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    /*
    Retrieves all users from the database.
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

    /*
    Returns the number of users.
     */
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
    Returns user specified by id.
     */
    public User getUserById(int UserId) {
        User user = new User();
        try {
            String query =  "select users.userId, users.userName, users.lastName, users.gender, users.dob, " +
                            "address.workAddress, address.homeAddress " +
                            "from users join address on users.userId = address.userId " +
                            "where users.userId=?;";
            PreparedStatement preparedStatement = con.prepareStatement( query );
            preparedStatement.setInt(1, UserId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while( resultSet.next() ) {
                user.setUserId( resultSet.getInt( "userId" ) );
                user.setUserName( resultSet.getString( "userName" ) );
                user.setLastName( resultSet.getString( "lastName" ) );
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

    /*
    Deletes the specified user.
    Returns 1 if it was successful or 0 if it failed.
     */
    public int deleteUser(int userId){
        int rows_affected = 0;

        try{
            String query = "delete from users where userId=?;";
            PreparedStatement preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            rows_affected = preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rows_affected;
    }

}
