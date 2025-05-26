public class Address {
    private String fullName;
    private String phoneNumber;
    private String street;
    private String city;
    private String zipCode;

    public Address(String fullName, String phoneNumber, String street, String city, String zipCode) {
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.street = street;
        this.city = city;
        this.zipCode = zipCode;
    }

    public void updateAddress(String fullName, String phoneNumber, String street, String city, String zipCode) {
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.street = street;
        this.city = city;
        this.zipCode = zipCode;
    }

    @Override
    public String toString() {
        return "Name: " + fullName + "\nPhone: " + phoneNumber +
               "\nStreet: " + street + "\nCity: " + city + "\nZip Code: " + zipCode;
    }
}