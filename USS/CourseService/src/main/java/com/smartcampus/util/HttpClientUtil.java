package com.smartcampus.util;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;

public class HttpClientUtil {
    public static boolean validateLecturer(int lecturerId) {
        String targetStr = "https://atlyi-41-186-138-147.a.free.pinggy.link/LecturerService_Group3_war_exploded/api/lecturers";

        try {
            URL url = URI.create(targetStr).toURL();
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(5000);

            if (conn.getResponseCode() == 200) {
                InputStreamReader reader = new InputStreamReader(conn.getInputStream());
                // 1. Get the root object
                JsonObject root = JsonParser.parseReader(reader).getAsJsonObject();

                // 2. Get the "data" array from the root
                JsonArray dataArray = root.getAsJsonArray("data");

                // 3. Loop through the lecturers in the data array
                for (JsonElement element : dataArray) {
                    int idFromGroup3 = element.getAsJsonObject().get("id").getAsInt();
                    if (idFromGroup3 == lecturerId) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("Communication Error: " + e.getMessage());
        }
        return false;
    }
}