package com.POS.POS.service;

import com.POS.POS.entity.Client;
import com.POS.POS.repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ClientService {
    @Autowired
    private ClientRepository clientRepository;

    @Transactional
    public Client save(Client client) {
        return clientRepository.save(client);
    }

    @Transactional
    public List<Client> saveAll(List<Client> clients) {
        return clientRepository.saveAll(clients);
    }

    public List<Client> findAll() {
        return clientRepository.findAll();
    }

    public Page<Client> findAll(Pageable pageable) {
        return clientRepository.findAll(pageable);
    }

    public Client findById(int id) {
        return clientRepository.findById(id).orElse(null);
    }

    @Transactional
    public Client update(int id, Client client) {
        client.setId(id);
        return clientRepository.save(client);
    }

    @Transactional
    public void delete(int id) {
        clientRepository.deleteById(id);
    }
}
