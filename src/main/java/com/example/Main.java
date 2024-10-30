package com.example;

public class Main {
    public static void main(String[] args) {
        Dto dto = new Dto("John", 25);
        System.out.println("Hello world!");
        System.out.println("This does work much faster because it's cached!");

        System.out.println(dto.getName());
        System.out.println(dto.getAge());

    }
}