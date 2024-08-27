package com.example.demo.dummyentity;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DemoOrder {
    Date date;
    BigDecimal tamt;
    int bid, pid;
    private List<DemoOrderDetails> orderDetails = new ArrayList<>();
}
