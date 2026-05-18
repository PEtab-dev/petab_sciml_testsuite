"""Neural network import test generation"""

import torch
from torch import nn
from torch.nn import functional as F
from pysrc.ml_import_helper import make_yaml, test_nn


class Net(nn.Module):
    def __init__(self) -> None:
        super().__init__()
        self.layer1 = nn.Linear(2, 5)
        self.layer2 = nn.Linear(5, 5)
        self.layer3 = nn.Linear(5, 1)

    def forward(self, net_input: torch.Tensor) -> torch.Tensor:
        x = self.layer1(net_input)
        x = F.tanh(x)
        x = self.layer2(x)
        x = F.tanh(x)
        x = self.layer3(x)
        return x


def ml_model_import_001(dir_save):
    net = Net()
    make_yaml(net, dir_save)
    test_nn(net, dir_save, ["layer1", "layer2", "layer3"])
    return 0
