package utils;

import java.time.LocalDate;

public class Utiles {
    public static String getStatusCalendar(LocalDate inputDate) {
        LocalDate currentDate = LocalDate.now();

        if (currentDate.isAfter(inputDate)) {
            return "past";
        } else if (currentDate.isBefore(inputDate)) {
            return "upcoming";
        } else {
            return "current";
        }
    }
}
