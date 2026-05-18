"""Neural network import test generation"""

import torch
from torch import nn
from torch.nn import functional as F
from pysrc.ml_import_helper import make_yaml, test_nn


class Net(nn.Module):
    def __init__(self) -> None:
        super().__init__()
        self.layer1 = nn.Linear(2, 5)
        self.layer2 = nn.Linear(5, 1)

    def forward(self, net_input: torch.Tensor) -> torch.Tensor:
        x = self.layer1(net_input)
        x = F.tanhshrink(x)
        out = self.layer2(x)
        return out


def ml_model_import_031(dir_save):
    net = Net()
    make_yaml(net, dir_save)
    test_nn(net, dir_save, ["layer1", "layer2"])
    return 0
