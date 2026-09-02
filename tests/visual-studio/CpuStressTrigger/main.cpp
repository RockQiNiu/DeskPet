#include <atomic>
#include <algorithm>
#include <chrono>
#include <cstdlib>
#include <iostream>
#include <thread>
#include <vector>

int main(int argc, char **argv)
{
    const int seconds = argc > 1 ? std::max(1, std::atoi(argv[1])) : 30;
    const unsigned workers = std::max(1u, std::thread::hardware_concurrency());
    std::atomic_bool running = true;
    std::vector<std::thread> threads;
    for (unsigned i = 0; i < workers; ++i) {
        threads.emplace_back([&] { volatile unsigned long long value = 1; while (running) value = value * 1664525ULL + 1013904223ULL; });
    }
    std::cout << "CPU stress started on " << workers << " threads for " << seconds << " seconds.\n";
    std::this_thread::sleep_for(std::chrono::seconds(seconds));
    running = false;
    for (auto &thread : threads) thread.join();
    std::cout << "CPU stress finished.\n";
}
