package utils;

import dao.VotingDAO;
import model.Pilot;
import model.Voting;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class Utiles {
    private static final VotingDAO votingDAO = new VotingDAO();
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

    public static Voting ordenarPilotosPuntuacion() throws SQLException {
        Voting allVoting = votingDAO.getAllVoting();
        List<Pilot> listPilots = allVoting.getPilots()
                .stream()
                .sorted(Comparator.comparing(Pilot::getPuntos).reversed())
                .collect(Collectors.toList());
        allVoting.setPilots(listPilots);
        return allVoting;
    }
}
