# TaxiClone (Yandex Taxi / Uber Clone)

TaxiClone is a full-stack iOS application that simulates the core functionality of ride-hailing services like Yandex Taxi or Uber.  
The project focuses on real-time interaction between users and drivers, backend integration, and scalable architecture.

## Features

- User authentication (sign up / login)
- Role-based flow (Passenger / Driver)
- Create and request rides
- Real-time ride updates
- Driver accepts/rejects ride requests
- Basic trip lifecycle (request → accept → complete)
- Location-based logic (simulated or real)
- Clean and responsive UI

## Tech Stack

### iOS (Frontend)
- Swift
- UIKit (programmatic UI)
- MVVM
- CoreLocation
- URLSession

### Backend
- Firebase Authentication
- Firebase Firestore
- Firebase Realtime Database

## Architecture

The app follows **MVVM (Model-View-ViewModel)**:

- **View** — UI and user interaction
- **ViewModel** — business logic and state management
- **Model** — data structures and backend interaction

Firebase is used as a Backend-as-a-Service to handle:
- Authentication
- Real-time data synchronization
- Storage of rides and users

## Main Flows

### Passenger Flow
1. User logs in
2. Creates a ride request
3. Waits for driver
4. Receives updates in real time

### Driver Flow
1. Driver logs in
2. Sees available ride requests
3. Accepts a ride
4. Completes the trip

## What I Learned

While building this project, I gained experience in:

- Designing client-server architecture
- Working with Firebase services (Auth, Firestore, Realtime DB)
- Handling real-time data updates
- Managing app state across multiple user roles
- Structuring scalable mobile applications
- Synchronizing data between multiple users

## Practical Value

This project simulates a real production-level system and demonstrates how ride-hailing apps work under the hood.  
It helped me understand real-time systems, backend integration, and multi-user interaction.

## Installation

1. Clone the repository:

```bash
git clone https://github.com/iblamenooo/TaxiClone.git
