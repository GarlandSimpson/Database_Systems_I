import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the FlyingApplication class
 * in a similar manner to the sample RunStoresApplication.java program.
*/


public class RunFlyingApplication
{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username
            // and password for your Postgres account in the arguments of the
            // getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cmps180-db.lt.ucsc.edu/username",
                                                     "username",
                                                     "password");
            
            if (connection != null)
                System.out.println("\nConnected to the database!\n\n");
			FlyingApplication app = new FlyingApplication(connection);
            /* Include your code below to test the methods of the FlyingApplication class
             * The sample code in RunStoresApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
            
            
            // ***** TEST getAirlinesWithManyFlights(5);         *****
            System.out.println("TEST: getAirlinesWithManyFlights(3);\n");
			int numFlights = 3;
		    List<String> titles = app.getAirlinesWithManyFlights(numFlights);
			for (String title : titles)
				System.out.println(title);
				
			/*
			*Output of getAirlinesWithManyFlights
			*when the parameter numberOfFlights is 3.
			 
			 American Airlines
			 Delta Airlines
			 Frontier Airlines
			 JetBlue Airways
			 Southwest Airlines
			 Spirit Airlines
			 United Airlines
			 Virgin America

			*/	
				
			// ***** TEST raiseAirlineTicketCosts('VRD', 1000); *****
			System.out.println("\n\nTEST: raiseAirlineTicketCosts('UAL', 25);\n");
			String name = "UAL";
			int increase = 25;
			int sum = app.raiseAirlineTicketCosts(name, increase);
			System.out.println(sum);
			
	
			// ***** TEST deleteSomeUnpaidTickets(1);          *****
			System.out.println("\n\nTEST: deleteSomeUnpaidTickets(1);\n");
			int totalCost = app.deleteSomeUnpaidTickets(1);
			System.out.println(totalCost + "\n");
			
			
			// ***** TEST deleteSomeUnpaidTickets(2);          *****
			System.out.println("\n\nTEST: deleteSomeUnpaidTickets(2);\n");
			totalCost = app.deleteSomeUnpaidTickets(2);
			System.out.println(totalCost + "\n");
            
            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
