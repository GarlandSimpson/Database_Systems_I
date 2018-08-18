import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the Flying database interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */
public class FlyingApplication {

    private Connection connection;
    
    /*
     * Constructor
     */
    public FlyingApplication(Connection connection) {
        this.connection = connection;
    }
    
    public Connection getConnection()
    {
        return connection;
    }
    
     /**
     * Takes as argument an integer called numberOfFlights.
     * Returns the AirlineName (not the AirlineID) for each Airline that has 
     * at least numberOfFlights different Flights.
     */
	// javac RunFlyingApplication.java java RunFlyingApplication

    public List<String> getAirlinesWithManyFlights(int numberOfFlights)
    {
    List<String> result = new ArrayList<String>();
        // your code here

		// initalize a null Statement and store query
		Statement stmt = null; 
		String q = "SELECT a.airlinename, count(distinct f.flightnum)" +
		           " FROM airlines a, flights f" +
		           " WHERE a.airlineid = f.airlineid" + 
		           " GROUP BY a.airlinename";

		try {
			// create the statement and assign it to stmt
			stmt = connection.createStatement();
			
			// execute the query q and assign it to ResultSet r
			ResultSet r = stmt.executeQuery(q);
		
			// while there are still entries
			while(r.next()) {
				// if the airline has atleast numberOfFlights get the AirlineName
				if (r.getInt(2) >= numberOfFlights)
					result.add(r.getString(1));
			}
		  
		} // catch exceptions
		catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
			
		} // close up shop
		finally {
			if ( stmt != null ) {
				try {
					stmt.close();
				} catch (SQLException e) {}
				stmt = null;
			}
		}
        // end of your code
        return result;
    }
    
    
    
    /**
     * Takes an AirlineID and an increment as arguments, and raises the cost of all 
     * tickets that have that AirlineID by the amount specified in the increment argument. 
     * Of course, there may be many tickets that have that AirlineID.  If there are no 
     * tickets with that name, raiseAirlineTicketCosts should do nothing. The update  
     * should be performed as a single SQL statement.  raiseAirlineTicketCosts should 
     * return the number of tickets whose cost was incremented.
     */

    public int raiseAirlineTicketCosts(String AirlineID, int increment) {
        // your code here; return 0 appears for now to allow this skeleton to compile
		// return 0;
		
		// initalize a null PreparedStatement and store the query
		PreparedStatement pstmt = null;
		String q = "UPDATE TICKETS SET cost = cost + ?" + 
		           " WHERE airlineid = ?"; 
		int r = 0;
		
		try {
			// create the prepared statement and assign it pstmt
			pstmt = connection.prepareStatement(q);
			// set the parameters to increment, and AirlineID
			pstmt.setInt(1, increment);
			pstmt.setString(2, AirlineID);
			// execute the update
			r = pstmt.executeUpdate();
			
		} // catch exceptions
		catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
			
		} // close up shop
		finally {
			if ( pstmt != null ) {
				try {
					pstmt.close();
				} catch (SQLException e) {}
				pstmt = null;
			}
		}
		return r; // return the number of tickets incremented
		
        // end of your code
    }
    
    
    /**
     * The deleteSomeUnpaidTickets method takes as integer deleteCount as input and invokes 
     * the deleteUnpaid stored function with that argument. The Lab4 assignment gives details 
     * on which unpaid tickets the stored function deleteUnpaid should delete.
     * The method deleteSomeUnpaidTickets must use a single SQL statement to call the stored
     * function, and must return the integer result of the deleteUnpaid stored function.
     */
    public int deleteSomeUnpaidTickets(int deleteCount)
    {
        int storedFunctionResult = 0;
        // your code here
        
        // initalize a null callable statement
        CallableStatement stmt = null;
        
		try {
			// prepare call and assign it to stmt
			stmt = connection.prepareCall("{? = call deleteUnpaid(?) }");
			// set the output and input parameter types
			stmt.registerOutParameter(1, Types.INTEGER);
			stmt.setInt(2, deleteCount);
			// execute the call and store the result
			stmt.execute();
			storedFunctionResult = stmt.getInt(1);
				
		} // catch exceptions
		catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
			
		} // close up shop
		finally {
			if ( stmt != null ) {
				try {
					stmt.close();
				} catch (SQLException e) {
					System.out.println("SQLException: " + e.getMessage());
				}
				stmt = null;
			}
		}
        
        // end of your code
        return storedFunctionResult;
    }
};
