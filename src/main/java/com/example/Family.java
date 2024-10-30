package com.example;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class Family {

    private final Dto[] familyMembers;

    public void printFamily() {
        for (Dto member : familyMembers) {
            System.out.println(member.getName() + " is " + member.getAge() + " years old.");
        }
    }

}
