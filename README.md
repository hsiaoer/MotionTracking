# SwingWatch: Using Device Motion on the Watch

## About SwingWatch

This sample demonstrates how to use Device Motion for local processing on the watch. This sample application counts swings in a racquet sport and provides visual feedback to the user.

## Structure

The project consists of 1 interface controller and 3 model classes.

### View Controllers

1) InterfaceController 
    - Manages main app interaction UI.

### Models

There are a few model classes that are used throughout the app:

1) WorkoutManager
2) MotionManager
3) RunningBuffer

## What's Important

This sample code uses Device Motion and RunningBuffer to calculate statistics over the recent samples. This is combined with the wrist state to enable forehand and backhand swing detection.

The application uses Force Touch to start and stop a workout. The HealthKit workout session enables background processing of the Device Motion samples.

The important parts of the application are:
1. Instantiating a HKHealthStore and starting an HKWorkoutSession.
2. Instantiating CMMotionManager and calling startDeviceMotionUpdates.
3. The CMDeviceMotion samples are processed by the application in an efficent manner to produce the swing counts.
4. Stopping the HKWorkoutSession and calling stopDeviceMotionUpdates.

Applications should then submit workout metrics to HealthKit (not implemented in this sample).

The MotionManager also contains several application specific constants that should be tuned to your specific needs.

## Requirements

### Build
Xcode 8.0, iOS 10.0 SDK, watchOS 3.0 SDK

### Runtime
iOS 10.0 or later; watchOS 3.0 or later

Copyright (C) 2016 Apple Inc. All rights reserved.

