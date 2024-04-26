package atu.Class;

/**
 *
 * @author alber
 */
public enum Role {
    STUDENT("Student"),
    TEACHER("Teacher"),
    STAFF("Staff");
    
    private String name;
        
    Role(String name){
        this.name = name;
    }
    
    public String getName(){
        return name;
    }
}
