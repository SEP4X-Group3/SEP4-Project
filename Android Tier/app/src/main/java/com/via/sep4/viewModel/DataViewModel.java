package com.via.sep4.viewModel;

import androidx.lifecycle.ViewModel;

import com.via.sep4.repository.DataRepository;

public class DataViewModel extends ViewModel {
    DataRepository repository;

    public DataViewModel(){
        repository = DataRepository.getInstance();

    }

}